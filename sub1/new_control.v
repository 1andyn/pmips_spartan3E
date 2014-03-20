module new_control(
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
	Instr,
	reset
	);
	
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
input [15:0] Instr;

reg RegWrite;
reg RegDst;
reg ALUSrc;
reg [1:0] ALUOp;
reg Branch;
reg MemWrite;
reg MemRead;
reg MemtoReg;

always @(OpCode or reset)
	begin
		if(Instr == 0)
				begin
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
					RegWrite = 1; // 2nd register field
					RegDst = 1; // Use Third field
					ALUSrc = 0;
					ALUOp = 2; // R-type
					Branch = 0;
					MemWrite = 0; //No Access to Memory
					MemRead = 0;
					MemtoReg = 0;
					end
				2: begin // opcode for BEQ
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
					RegWrite = 0;
					RegDst = 0;   // 2nd register field
					ALUSrc = 1;   // Use sign extended constant
					ALUOp = 0;    // Add
					Branch = 0; 
					MemWrite = 1; // No access to memory
					MemRead = 0; //doesnt matter
					MemtoReg = 0; // Write reg file from ALU
					end
				7: begin
					end
				8: begin
					end
				default:
					begin
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
endmodule
