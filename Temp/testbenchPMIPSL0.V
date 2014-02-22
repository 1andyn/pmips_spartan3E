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
module testbench2;
/*
wire [2:0] probe1;
wire [1:0] probe2;
wire [2:0] probe3;
wire [3:0] probe4;
wire [15:0] probe5;
wire [2:0] probe6;
wire [15:0] probe7;
wire [2:0] probe8;
wire [6:0] probe9;
wire [15:0] probe10;
wire [2:0] probe11;
wire [15:0] probe12;
wire [15:0] probe13;
wire [15:0] probe15;
wire [15:0] probe16;
wire probe17;
wire probe14;
wire [15:0] probe18;
wire probe19;
wire probe20;
wire probe21;
wire [15:0] probe22;
wire [15:0] probe23;*/
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

reg  [15:0] imemrdata;	// Instruction memory read data
wire [15:0] dmemrdata;	// Data memory read data

reg  clock;
reg  reset;		// Reset

// Clock
initial clock=0;
always #1 clock=~clock;

// Test signals
// Insert instructions for testing
// You can modify it to test your computer.
// Here are other samples of instructions:
// beq $0,$0,[offset= -4] = {3'd2, 3'd0, 3'd0,7'b1111110}; Note the instruction
//      stores the constant value  -2 since the the offset is -4
// slt $4,$3,$0 = {3'd0, 3'd3, 3'd0, 3'd4, 4'd4}

initial
	begin
	imemrdata = {3'd3, 3'd0, 3'd1,7'd3};  // addi $1,$0,3
	reset = 1;
	#2
	$display("\n Reset = 0 \n"); 
	$display("\n addi $1,$0,3 \n"); 
	reset = 0;
	#8
	$display("\n $addi $2,$3,4 \n"); 
	imemrdata = {3'd3, 3'd0, 3'd2,7'd4};  // addi $2,$0,4 (original add addi $1,$3,4)
	#8
	$display("\n $add $4,$2,$1 \n"); 
	imemrdata ={3'd0, 3'd2, 3'd1, 3'd4, 4'd3};  // add $4,$2,$1 //original add $4,$3,$0
	#8
	$display("\n $beq $0,$0, -4 \n"); 
	imemrdata ={3'd2, 3'd0, 3'd0,7'b1111110};
	#8

	$stop;
	end
	
initial
	begin
	$display("IMem(PC,Instr),ALU(Result,Out), ALU(Clock,Reset), IFIDINSTR\n");
	//$display("IMem(PC,Instr),ALU(Result,Out), ALU(Clock,Reset), Control OPCODE, ALUOP, ALUSEL, INSTRDEX) Reg(R1, R2, Value at R1, Value at R2, IMM, WriteData, WriteRegister) INSTRUCTION, ALUout\n");
	//$monitor("PC(%d,%b) ALU(%d,%d) [%b,%b] IFIDOP[%d], ALUOP[%d], ALUSEL[%d], IDEX ALUCTRL IST FNCT[%d]); R[%d]=%d, R[%d]=%d ; Imm Value:[%d], WB[%d] = %d--Instruction:[%b],Result of ALU:%d, WriteEnable: %b---[%d][%d]--ALUMUX Select = %d, Second ALU Input: %d; PCSrc: %b, [%b, %b] PC[%b], BRANCH[%b]",
	$monitor("PC(%d,%b) ALU(%d,%d) [%b,%b], IFID[%b], R0(%d),R1(%d),R2(%d),R3(%d),R4(%d),R5(%d),R6(%d),R7(%d)", 
		imemaddr,
		imemrdata,
		aluresult,
		dmemaddr,
		clock,
		reset,
		probe24,
		/*
		probe1,
		probe2,
		probe3,
		probe4,
		probe6,
		probe5,
		probe8,
		probe7, //
		probe9, // Immediate
		probe11, // Write Back Data (swapped 11,10)
		probe10, //Address that data will be written to
		probe12,// Instruction bits received
		probe13, // RESULT coming from ALU
		probe14,
		probe15,
		probe16,//ALUOUT
		probe17,
		probe18,
		probe19,
		probe20,
		probe21,
		probe22,
		probe23
		*/
		reg0,
		reg1,
		reg2,
		reg3,
		reg4,
		reg5,
		reg6,
		reg7
		); //ALUMux select
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
	/*probe1,
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
	probe23,*/
	probe24,
		reg0,
		reg1,
		reg2,
		reg3,
		reg4,
		reg5,
		reg6,
		reg7
	);


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