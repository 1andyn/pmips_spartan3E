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
	reset,			// Used to clear controller
	IFID,
	IDEX,
	EXMEM
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

input  clock;
input  [2:0] OpCode;		
input  reset;

//Instruction Registers
input [15:0] IFID;
input [15:0] IDEX;
input [15:0] EXMEM;	

reg PCStall;
reg RegWrite;
reg RegDst;
reg ALUSrc;
reg [1:0] ALUOp;
reg Branch;
reg MemWrite;
reg MemRead;
reg MemtoReg;
reg NoStall;

always @(NoStall)
	begin
	if(NoStall == 1) PCStall = 0;
	else PCStall = 1;
	end

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

always @(OpCode or reset)
	begin
		case(OpCode)
			0: begin // opcode for R-type 
//				PCStall = 0;
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
//				PCStall = 0;
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
//				PCStall = 0;
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
//				PCStall = 0;
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
//				PCStall = 0;
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
//				PCStall = 0;
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
/*
	I TYPE DESTINATION REGISTER = 9:7
	R TYPE DESTINATION REGISTER = 6:4

	ADDI READ REGISTER = 12:10
	RTYPE READ REGISTERS = 12:10, 9:7
*/

// For this processor only RAW (Read after Write is a Hazard)
always @(posedge clock)
	begin
		if(reset == 1)
		begin
			NoStall = 0; // Stall
		end
		
		else
		begin
			//If both these are bubbles, do NOT STALL
			if(IDEX[15:0] == 0 && EXMEM[15:0] == 0)
			begin
				NoStall = 1;
			end
			//If Only IDEX is a Bubble
			else if(IDEX[15:0] == 0 && EXMEM[15:0] != 0)
			//II
			begin
				if(IFID[15:13] != 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == EXMEM[9:7])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end
			//IR
				else if(IFID[15:13] != 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == EXMEM[6:4])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end	
			//RI
				else if(IFID[15:13] == 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == EXMEM[9:7] || IFID[9:7] == EXMEM[9:7])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end	
			//RR
				else if(IFID[15:13] == 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == EXMEM[6:4] || IFID[9:7] == EXMEM[6:4])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end
			end
			
			//Only EXMEM is Bubble
			else if(IDEX[15:0] != 0 && EXMEM[15:0] == 0)
			begin
				if(IFID[15:13] != 0 && IDEX[15:13] != 0)
				begin
					if(IFID[12:10] == IDEX[9:7])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end
			//IR
				else if(IFID[15:13] != 0 && IDEX[15:13] == 0)
				begin
					if(IFID[12:10] == IDEX[6:4])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end	
			//RI
				else if(IFID[15:13] == 0 && IDEX[15:13] != 0)
				begin
					if(IFID[12:10] == IDEX[9:7] || IFID[9:7] == IDEX[9:7])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end	
			//RR
				else if(IFID[15:13] == 0 && IDEX[15:13] == 0)
				begin
					if(IFID[12:10] == IDEX[6:4] || IFID[9:7] == IDEX[6:4])
					begin
						NoStall = 0; //Stall
					end
					else NoStall = 1; //No stall
				end
			end
			
			else
			begin //BOTH EXMEM AND IDEX ARE NOT BUBBLES
				
				//III
				if(IFID[15:13] != 0 && IDEX[15:13] != 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == IDEX[9:7] || IFID[12:10] == EXMEM[9:7]) NoStall = 0; //Stall
					else NoStall = 1; // No Stall
				end
				
				//IIR
				else if(IFID[15:13] != 0 && IDEX[15:13] != 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == EXMEM[6:4] || IFID[12:10] == IDEX[9:7]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				//IRI
				else if(IFID[15:13] != 0 && IDEX[15:13] == 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == EXMEM[9:7] || IFID[12:10] == IDEX[6:4]) NoStall = 1; //Don't Stall
					else NoStall = 1;
				end
				
				//IRR
				else if(IFID[15:13] != 0 && IDEX[15:13] == 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == IDEX[6:4] || IFID[12:10] == EXMEM[6:4]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				//RII
				else if(IFID[15:13] == 0 && IDEX[15:13] != 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == IDEX[9:7] || IFID[12:10] == EXMEM[9:7] ||
					IFID[9:7] == IDEX[9:7] || IFID[9:7] == EXMEM[9:7]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				//RIR
				else if(IFID[15:13] == 0 && IDEX[15:13] != 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == IDEX[9:7] || IFID[12:10] == EXMEM[6:4] ||
					IFID[9:7] == IDEX[9:7] || IFID[9:7] == EXMEM[6:4]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				//RRI
				else if(IFID[15:13] == 0 && IDEX[15:13] == 0 && EXMEM[15:13] != 0)
				begin
					if(IFID[12:10] == IDEX[6:4] || IFID[12:10] == EXMEM[9:7] ||
					IFID[9:7] == IDEX[6:4] || IFID[9:7] == EXMEM[9:7]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				//RRR
				else if(IFID[15:13] == 0 && IDEX[15:13] == 0 && EXMEM[15:13] == 0)
				begin
					if(IFID[12:10] == IDEX[6:4] || IFID[12:10] == EXMEM[6:4] ||
					IFID[9:7] == IDEX[6:4] || IFID[9:7] == EXMEM[6:4]) NoStall = 0; //Stall
					else NoStall = 1;
				end
				
				else NoStall = 1; //Don't Stall	
			end	
			
		end
	end

endmodule
