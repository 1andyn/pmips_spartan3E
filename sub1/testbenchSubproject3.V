// EE 361L
// testbench for PMIPSL0
//  
// Note that the PMIPSL0.V file has an incomplete version of
// the computer.  In addition some of the signal values have
// be set to particular values.  For example, the inputs
// to the register file have been set to write the value "5"
// into register $3.  You need to replace this as you
// complete the computer design.
// 
module testbench5;

wire [15:0] imemaddr; 	// Instruction memory addr
wire [15:0] dmemaddr;	// Data memory addr
wire [15:0] dmemwdata;	// Data memory write-data
wire dmemwrite;	// Data memory write enable
wire dmemread;	// Data memory read enable
wire [15:0] aluresult;	// Output from the ALU:  for debugging
wire [15:0] aluout;		// Output from the ALUOut register:  for debugging

wire [15:0] imemrdata;	// Instruction memory read data
wire [15:0] dmemrdata;	// Data memory read data
wire debug;
wire [15:0] debug2;
wire [15:0] debug3;
wire [15:0] debug4;
wire [15:0] debug7;
wire debug5;
wire [15:0]debug6;
wire debug8;
wire [2:0] Predict;

wire stall;
reg io_sw0;
reg io_sw1;
wire [6:0] io_display;
wire [15:0] branch;
wire [15:0] RegDst;
wire [2:0] regg;

reg  clock;
reg  reset;		// Reset

// Clock
initial clock=0;
always #1 clock=~clock;


initial 
	begin
	$display("\nIO[display,switch0,switch1]\n");
	$display("IMEM[PC,Instr]\n");
	$display("DMEM[address, rdata, wdata]\n");
	$display("ALU[result]\n");
	$display("Signals[clock,reset,time]");
	reset=1;
	#2
	reset=0;
	#75
	$finish;
	end


initial
	$monitor("IMEM[%d,%b] DMEM[%d,%d,%d] ALU[%d] Signals[%b,%b,%0d], PCStall:[%b], Flush: %b, IFID:%b, IDEX: %b, EXMEM:%b ", //Write:%b, DATA:%b, wdata:%d, Predict Stage: %d, WriteData: %d, WriteRegister: %d, Branch:%d",

		imemaddr,
		imemrdata,
		
		dmemaddr,
		dmemrdata,
		dmemwdata,
		
		aluresult,
		
		clock,
		reset,
		$time,
		//debug,
		debug8,
		stall,
		debug2,
		debug3,
		debug4
		/*debug5,
		debug6,
		debug7,
		Predict,
		RegDst,
		regg,
		branch*/
		);


// Instantiation of processor

	
PMIPSL1 comp(
	imemaddr, 	// Instruction memory addr
	dmemaddr,	// Data memory addr
	dmemwdata,	// Data memory write-data
	dmemwrite,	// Data memory write enable
	dmemread,	// Data memory read enable
	aluresult,	// Output from the ALU:  for debugging
	clock,
	imemrdata,	// Instruction memory read data
	dmemrdata,	// Data memory read data
	reset,		// Reset
	debug,
	debug8,
	stall,
	debug2,
	debug3,
	debug4,
	debug5,
	debug6,
	debug7,
	Predict,
	RegDst,
	regg,
	branch
	);

// Instantiation of Instruction Memory (program)

IM  instrmem(imemrdata,imemaddr);


// Instantiation of Data Memory


DMemory_IO datamemdevice(
		dmemrdata,	// read data
		io_display,	// IO port connected to 7 segment display
		clock,		// clock
		dmemaddr,	// address
		dmemwdata,	// write data
		dmemwrite,	// write enable
		dmemread,	// read enable
		io_sw0,		// IO port connected to sliding switch 0
		io_sw1		// IO port connected to sliding switch 1
		);



endmodule