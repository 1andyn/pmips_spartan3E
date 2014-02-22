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
module testbench4;
wire [15:0] probe15;
wire [15:0] probe16;
wire [15:0] imemaddr; 	// Instruction memory addr
wire [15:0] dmemaddr;	// Data memory addr
wire [15:0] dmemwdata;	// Data memory write-data
wire dmemwrite;	// Data memory write enable
wire dmemread;	// Data memory read enable
wire [15:0] aluresult;	// Output from the ALU:  for debugging
wire [15:0] aluout;		// Output from the ALUOut register:  for debugging

wire [15:0] imemrdata;	// Instruction memory read data
wire [15:0] dmemrdata;	// Data memory read data

wire [15:0] reg0;
wire [15:0] reg1;
wire [15:0] reg2;
wire [15:0] reg3;
wire [15:0] reg4;
wire [15:0] reg5;
wire [15:0] reg6;
wire [15:0] reg7;

reg  clock;
reg  reset;		// Reset

// Clock
initial clock=0;
always #1 clock=~clock;


initial // Reset the computer and then let it run
	begin
	reset = 1;
	#2
	reset = 0;
	#70
	$stop;
	end
	
initial
	begin
	$display("IMem(PC,Instr),ALU(Output), Dmem(Addr,rdata,wdata) [Clock,Reset]\n");
	$monitor("PC(%d,%b) ALU(%d) Dmem(%d,%d,%d) [%b,%b]",
		imemaddr,
		imemrdata,
		aluresult,
		dmemaddr,
		dmemrdata,
		dmemwdata,
		clock,
		reset);
	end

// Instantiation of processor

PMIPSL0 comp(
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
	probe15,
	probe16,
	reg0,
	reg1,
	reg2,
	reg3,
	reg4,
	reg5,
	reg6,
	reg7
	);

// Instantiation of Instruction Memory (program)

IM2  instrmem(imemrdata,imemaddr);

// Instantiation of Data Memory

wire io_sw0;
wire io_sw1;
wire [6:0] io_display;

assign io_sw0 = 0;
assign io_sw1 = 1;


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