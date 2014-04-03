// Testbench for the Controller circuit for PMIPSL0
// This is a simple one
module testbench3;



// We need to insert input signals to the Controller

// We'll use register variables
reg clock;
reg [2:0] Opcode;
reg reset;

// We'll probe the outputs of the controller with wire variables

wire PCStall;	
wire PCSrc;		
wire RegWrite;
wire RegDst;
wire ALUSrc;
wire [1:0] ALUOp;
wire Branch;
wire MemWrite;
wire MemRead;
wire MemtoReg;

// Generate clock signal
initial clock = 0;
always #1 clock = ~clock; // Clock period = 2 time units

// Instantiation of the controller

Control control1(
	PCStall,		// if asserted it will stall the PC (hold value)
	RegWrite,
	RegDst,
	ALUSrc,
	ALUOp,
	Branch,
	MemWrite,
	MemRead,
	MemtoReg,
	clock,			// Clock input signal
	Opcode,			// Opcode from the IF/ID pipeline register
	reset			// Used to clear controller
	);


// The following generates input signals to the controller
initial
	begin
	
	$display("Testing Add Immediate \n");
	reset = 1;
	Opcode = 3; // opcode for addi
	#2			// delay one clock cycle
	reset = 0;
	#20			// delay 10 clock cycles
	
	$display("\n");
	$display("Testing R Type \n");
	reset = 1;
	Opcode = 0; // opcode for addi
	#2			// delay one clock cycle
	reset = 0;
	#20			// delay 10 clock cycles
	
	$display("\n");
	$display("Testing BEQ \n");
	reset = 1;
	Opcode = 2; // opcode for addi
	#2			// delay one clock cycle
	reset = 0;
	#20			// delay 10 clock cycles
	
	$stop;
	end
	


initial
	begin
	$display("PC(Stall,Src),Reg(Wr,Dst,MemtoReg), ALU(Src,Op), Mem(Wr,Rd), Br(Br) [Clk,Rst,Op]\n");
	$monitor("PC(%b) Reg(%b,%b,%b) ALU(%b,%d) Mem(%b,%b) Br(%b) [%b,%b,%d]",
		PCStall,				
		RegWrite,
		RegDst,
		MemtoReg,
		ALUSrc,
		ALUOp,
		MemWrite,
		MemRead,
		Branch,
		clock,
		reset,
		Opcode);
	end


endmodule