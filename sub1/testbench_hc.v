module testbench_hc;

reg  clock;
reg  reset;		// Reset

wire
wire
wire 

initial clock=0;
always #1 clock=~clock;


initial 
	begin

	end


initial
	$monitor("PCStall:%b",
		PCStall
		);


// Instantiation of processor

	
hazard_ctrl hctrl(
	PCStall,		// if asserted it will stall the PC (hold value)
	clock,			// Clock input signal
	reset,			// Used to clear controller
	IFID, //IFID Instruction
	IDEX, //IDEX Instruction
	EXMEM, //EXMEMInstruction
	EXMEMWrite,
	EXMEMRegDst,
	IDEXWrite,
	IDEXRegDst
	);

// Instantiation of Instruction Memory (program)

IM2  instrmem(imemrdata,imemaddr);



endmodule