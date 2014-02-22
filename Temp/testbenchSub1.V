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
module testbench;

wire [15:0] probe24;
wire [15:0] reg0;
wire [15:0] reg1;
wire [15:0] reg2;
wire [15:0] reg3;
wire [15:0] reg4;
wire [15:0] reg5;
wire [15:0] reg6;
wire [15:0] reg7;

wire [15:0] imemaddr; 	// Instruction memory addr
wire [15:0] dmemaddr;	// Data memory addr
wire [15:0] dmemwdata;	// Data memory write-data
wire dmemwrite;	// Data memory write enable
wire dmemread;	// Data memory read enable
wire [15:0] aluresult;	// Output from the ALU:  for debugging
wire [15:0] aluout;		// Output from the ALUOut register:  for debugging

wire [15:0] imemrdata;	// Instruction memory read data
wire [15:0] dmemrdata;	// Data memory read data

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
	#120 //originally 150
	$stop;
	end
	
initial
	begin
	$display("IMem(PC,Instr),ALU(Output), Dmem(Addr) [Clock,Reset]\n");
	//$monitor("PC(%d,%b) ALU(%d) Dmem(%d) [%b,%b], IFID (%b), R0(%d),R1(%d),R2(%d),R3(%d),R4(%d),R5(%d),R6(%d),R7(%d)",
	$monitor("PC(%d,%b) ALU(%d) Dmem(%d) [%b,%b]",
		imemaddr,
		imemrdata,
		aluresult,
		dmemaddr,
		clock,
		reset,
		/*probe24,
		reg0,
		reg1,
		reg2,
		reg3,
		reg4,
		reg5,
		reg6,
		reg7*/
		);
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
	reset		// Reset
	/*
	probe1,
	probe2,
	probe3,
	probe4,
	probe5,
	probe6,
	probe7,
	probe8,
	probe9,
	probe10,
	probe11,
	probe12,
	probe13,
	probe14,
	probe15,
	probe16,
	probe17,
	probe18,
	probe19,
	probe20,
	probe21,
	probe22,
	probe23,
	probe24,
	reg0,
	reg1,
	reg2,
	reg3,
	reg4,
	reg5,
	reg6,
	reg7*/
	);

// Instantiation of Instruction Memory (program)

IM  instrmem(imemrdata,imemaddr);


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