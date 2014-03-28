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
wire [3:0] code;
wire [2:0] debug1;
wire [2:0] debug2;
wire [2:0] debug3;
wire [2:0] debug4;
initial clock=0;
always #1 clock=~clock;
assign negclock =~clock;
// Instantiation of processor

hazard_ctrl hz2(
	MP, //MisPrediction
	PCStall,		// if asserted it will stall the PC (hold value) //PCStall
	clock,			// Clock input signal
	reset,			// Used to clear controller
	IFID, //IFID Instruction
	IDEX, //IDEX Instruction
	EXMEM, //EXMEMInstruction
	EXMEMWrite,
	EXMEMRegDst,
	IDEXWrite,
	IDEXRegDst,
	PCSrc,
	Predict,
	code,
	negclock,
	debug1,
	debug2,
	debug3,
	debug4
	);

initial 
	begin
		reset = 1;
		IFID = 16'b0000000000000000;
		IDEX = 16'b0000000000000000;
		EXMEM = 16'b0000000000000000;
		IDEXWrite = 0;
		EXMEMWrite = 0;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#3
		$display("NEXT\n");
		reset = 0;
		IFID = 16'b1101010100100010;
		IDEX = 16'b0110001010100000;
		EXMEM = 16'b0110000100000011;
		IDEXWrite = 1;
		EXMEMWrite = 1;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#3
		$display("NEXT\n");
		IFID = 16'b0110000100000011;
		IDEX = 16'b0110001010100000;
		EXMEM = 16'b1101010100100010;
		IDEXWrite = 1;
		EXMEMWrite = 1;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#3
		$display("NEXT\n");
		reset = 0;
		IFID = 16'b1101010100100010;
		IDEX = 16'b0110001010100000;
		EXMEM = 16'b0110000100000011;
		IDEXWrite = 1;
		EXMEMWrite = 1;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#3
		$display("NEXT\n");
		reset = 0;
		IFID = 16'b0111001000000101;
		IDEX = 16'b1011011000100010;
		EXMEM = 16'b1101010100100010;
		IDEXWrite = 1;
		EXMEMWrite = 1;
		EXMEMRegDst = 0;
		IDEXRegDst = 0;
		#3
		$finish;
	end

initial
	begin
	$monitor("PCStall:%b, IFID:%b, IDEX: %b, EXMEM[12:10]:%b, CODE:%d, IDEXREG:%d, EXMEMREG:%d, CMPARE:%d,CMPARE:%d,",
		PCStall,
		IFID,
		IDEX,
		EXMEM,
		code,
		debug2,
		debug1,
		debug3,
		debug4
		);
	end

endmodule