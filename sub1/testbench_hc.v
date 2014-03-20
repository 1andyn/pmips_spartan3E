module testbench_hc;

reg  clock;
reg  reset;		// Reset
reg [15:0] IFID; 
reg [15:0] EXMEM; 
reg [15:0] IDEX; 
reg IDEXWrite;
reg EXMEMWrite;
reg IDEXRegDst;
reg EXMEMRegDst;
wire PCStall;
wire [2:0] debug;
wire [2:0] debug1;
wire [2:0] debug2;
wire [2:0] debug3;
wire [2:0] debug4;

initial clock=0;
always #1 clock=~clock;

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
	IDEXRegDst,
	debug,
	debug1,
	debug2,
	debug3,
	debug4
	);

initial 
	begin
		reset = 0;
		IFID = 16'b1101010100100010;
		IDEX = 16'b0110001010100000;
		EXMEM = 16'b0110000100000011;
		IDEXWrite = 1;
		EXMEMWrite = 1;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#2
		$finish;
	end

initial
	begin
	$monitor("PCStall:%b, IDEXWR:%b, EXMEMWR: %b, IDIF[12:10]:%b, IFID[9:7]:%b, OPCODE:%b",
		PCStall,
		debug,
		debug1,
		debug2,
		debug3,
		debug4
		);
	end

endmodule