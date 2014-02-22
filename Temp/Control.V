// EE 361 Controller file for PMIPSL0
// 
// This includes ALUControl and Controller
// 

// The ALU Control module may be buggy, sorry.
// In fact, you may want to modify it to your own design
//
// The Controller module is incomplete
//
// Notice that the ports in module are listed
// as follows:  output ports, clock (if any),
// then input ports.
// This helps to keep things straight, especially
// when modules are instatiated in other
// modules.  This convention is used throughout
// all my examples.
// 


// The following is a combinational circuit.  Notice
// in the procedural always, the output ALUSelect 
// is completely defined, i.e., all possible values of
// its input (ALUOp, InstrFunct) result in ALUSelect
// being defined.


module ALUControl( 
	ALUSelect,		// Output to the select of the ALU
	ALUOp,			// From the Control
	InstrFunct		// Function field of the instruction
	);

output	[2:0] ALUSelect;
reg		[2:0] ALUSelect;

input 	[1:0] ALUOp;
input 	[3:0] InstrFunct;

always @(ALUOp or InstrFunct)
	begin
	if (ALUOp == 0) 
		ALUSelect = 0; // Add for lw/sw
	else if (ALUOp == 1) 
		ALUSelect = 1; // Sub for beq
	else if (ALUOp == 2)
		begin
		case (InstrFunct)
			2: ALUSelect = 1; // Subtract
			3: ALUSelect = 0; // Add
			4: ALUSelect = 2; // SLT
			6: ALUSelect = 4; // AND
			7: ALUSelect = 3; // OR
			default: ALUSelect = 0; // Note that jr is not implemented
		endcase
		end
	else ALUSelect = 0; // Default case
	end

endmodule

// Main Control circuit for the computer.  It's a sequential circuit with 
// states.
module Control(
	PCStall,		// if asserted it will stall the PC (hold value)
	RegWrite, //removed PCSrc
	RegDst,
	ALUSrc,
	ALUOp,
	Branch,
	MemWrite,
	MemRead,
	MemtoReg,
	clock,			// Clock input signal
	OpCode,			// Opcode from the IF/ID pipeline register
	reset			// Used to clear controller
	//controlcodedebug
	);

output PCStall;		
output RegWrite;
output RegDst;
output ALUSrc;
output [1:0] ALUOp;
output Branch;
output MemWrite;
output MemRead;
output MemtoReg;
//output controlcodedebug; //debug
input  clock;
input  [2:0] OpCode;		
input  reset;		

//assign controlcodedebug = ControlCode;

reg PCStall;
reg RegWrite;
reg RegDst;
reg ALUSrc;
reg [1:0] ALUOp;
reg Branch;
reg MemWrite;
reg MemRead;
reg MemtoReg;

// The next always is basically a combinational circuit that
// drives the output of the controller which controls the
// datapath.  Let's call this circuit "Output Driver".  The
// Output Driver has an encoded input of 2 bits named
// ControlCode.  Depending on the ControlCode value, the
// output is driven accordingly.  For example, if the
// ControlCode = 0 then this means the datapath should be
// in a "stall" and insert a bubble.  Therefore, the
// outputs have values which will create a stall at the PC
// and the output will control the datapath so it does a nop.
// As another example, suppose ControlCode = 1.  Then
// the datapath should proceed with executing the instruction
// in the IF/ID pipeline register.  Notice that the Output Driver
// has the control for the "addi" instruction, but that's it.
// Thus, the circuit is incomplete.  Complete it to implement
// your project.
	
reg [1:0] ControlCode;	// This is a 2 bit value that controls
						// the output of the Controller.  The following
						// always is a combinational circuit with
						// the following conversion
						//
						// Input   Output
						// 0       Stall
						// 1       Use opcode to determine datapath control
						// 
						// ControlCode is the output of a sequential 
						// circuit which is defined later in this file

always @(ControlCode or OpCode or reset)
	begin
	if (ControlCode == 0) // Bubble and PC stall
		begin
			PCStall = 1;
			RegWrite = 0;
			RegDst = 0;
			ALUSrc = 0;
			ALUOp = 0;
			Branch = 0;
			MemWrite = 0;
			MemRead = 0;
			MemtoReg = 0;
		end
	else
		begin
			case(OpCode)
				0: begin // opcode for R-type 
					PCStall = 0;
					RegWrite = 1; // 2nd register field
					RegDst = 1;
					ALUSrc = 0;
					ALUOp = 2; // R-type
					Branch = 0;
					MemWrite = 0; //No Access to Memory
					MemRead = 0;
					MemtoReg = 0;
					end
				2: begin // opcode for BEQ
					PCStall = 0;
					RegWrite = 0;
					RegDst = 0; // Doesnt matter
					ALUSrc = 0;
					ALUOp = 1; 
					Branch = 1;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0; // Doesn't matter
					end
				3:	begin // opcode for addi is 3
					PCStall = 0;
					RegWrite = 1;
					RegDst = 0;   // 2nd register field
					ALUSrc = 1;   // Use sign extended constant
					ALUOp = 0;    // Add
					Branch = 0; 
					MemWrite = 0; // No access to memory
					MemRead = 0; //doesnt matter
					MemtoReg = 0; // Write reg file from ALU
					end
				5: begin   // opcode for load
					PCStall = 0;
					RegWrite = 1;
					RegDst = 0;   
					ALUSrc = 1;   
					ALUOp = 0;    
					Branch = 0; 
					MemWrite = 0; 
					MemRead = 1; 
					MemtoReg = 1;
					end
				6: begin   // opcode for store
					PCStall = 0;
					RegWrite = 0;
					RegDst = 0;   // 2nd register field
					ALUSrc = 1;   // Use sign extended constant
					ALUOp = 0;    // Add
					Branch = 0; 
					MemWrite = 1; // No access to memory
					MemRead = 0; //doesnt matter
					MemtoReg = 0; // Write reg file from ALU
					end
				default:
					begin
					PCStall = 0;
					RegWrite = 0;
					RegDst = 0;
					ALUSrc = 0;
					ALUOp = 0;
					Branch = 0;
					MemWrite = 0;
					MemRead = 0;
					MemtoReg = 0;
					end
				endcase
			end
		end

//
// The next "always" is a sequential (Moore) circuit that controls
// the output of the datapath over time.  For example,
// if the controller is about to execute another instruction
// then it outputs the proper control values to the datapath.
// Then it will insert bubbles into the datapath until
// the instruction is completely executed.  This circuit
// is basically a state machine.  The state register is "state"
// and a state value 0 means to launch the instruction in IF/ID
// register into the processor.  Now while in state 0, the
// controller needs to determine what the instruction is based
// on the opcode value.  If the opcode = "addi" then it must
// stall twice.  These stalls are realized by states.
// If the opcode = "lw" then it may stall in a different
// way using other states.  The circuit below is implemented
// for addi
//
reg [4:0] state;	// 5-bit state register.  This may be
					// too many bits but at least we're safe.

always @(posedge clock)  // Update state
	begin
	if (reset == 1) state  <= 4; //modified from 0 //Works with state <= 4
	else
		case(state)
			0:	case(OpCode) // update state
				3:	state <= 1; // execute addi (opcode = 3)
				0: state <= 1; // R type
				2: state <= 1; // BEQ
				5: state <= 1;
				6: state <= 1;
				default: state <=0;
				endcase
			1:	state <= 2;			// stall 1
			2:	state <= 3;			// stall 2 //originally state <= 0; // Works with state <= 3
			3: state <= 0; //originally 0
			4: state <= 0; //call this the RESET state
			default: state <= 0;
		endcase
	end

always @(state) // Output of this sequential circuit, ControlCode
	case(state)
		0: ControlCode = 1; // Launch instruction if state = 0;
		default: ControlCode = 0; // Stall PC and insert bubbles for other states
	endcase
	
endmodule
