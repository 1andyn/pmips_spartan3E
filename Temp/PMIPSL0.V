module PMIPSL0(
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
	debug
	);

/* Outputs */
output [15:0] imemaddr; //16bit register for PC Instruction memory
output [15:0] dmemaddr; //Data memory address for ALU results [EXMEM]
output [15:0] dmemwdata; // Data Memory Data; reading data
output [15:0] aluresult; // Debug Output	
output dmemwrite;	// write 2 memory enable
output dmemread;	// read memory enable


//output probe15; //aluzero

output [15:0] debug;

/* Clock */
input clock;

/* Inputs */
input [15:0] imemrdata;	// instruction memory data
input [15:0] dmemrdata; 
input reset; 

/* --------------Buffer Stages----------------*/
/* IF/ID -> ID/EX -> EX/MEM -> MEM/WB */

// ---Variables in IF stage and PC logic --------
reg [15:0] PC; 
wire [15:0] PCPlus2;
//----------------------------------------------
//-----Variables in the IF/ID pipeline register

reg [15:0] IFIDInstr; 
reg [15:0] IFIDPCPlus2;
wire [15:0] IFIDSignExt;
wire [6:0] IFIDConst;
wire [2:0] IFIDOpcode;
wire [2:0] IFIDRegfield1;
wire [2:0] IFIDRegfield2;
wire [2:0] IFIDRegfield3;

//----------------------------------------------//-----Variables in the ID stage
/* 16 bits */

wire [15:0] rdata1; // Variables connected to reg file
wire [15:0] rdata2; 
wire [15:0] wdata; //write back data (written data)
wire negclock;
wire [1:0] ALUOp;

// ----------Variables from the controller----------
wire PCStall;	// Stall signal for PC
wire PCSrc;		// These signals are for the datapath
wire RegWrite;
wire RegDst;
wire ALUSrc;
wire Branch;
wire MemWrite;
wire MemRead;
wire MemtoReg;

//----------------------------------------------
//Variables in the ID/EX pipeline register
reg [15:0] IDEXPCPlus2; 
reg [15:0] IDEXRegRead1; //reading data from first reg
reg [15:0] IDEXRegRead2; //reading data from sec reg
reg [15:0] IDEXInstr; // instruction
reg [15:0] IDEXSignExtend;
reg [2:0] IDEXRegfield2;
reg [2:0] IDEXRegfield3;
reg [1:0] IDEXALUOp;reg IDEXALUSrc;
reg IDEXRegDst; //Register destination signal
reg IDEXRegWrite; //Write to register signal
reg IDEXMemRead; //Read from memroy signal
reg IDEXMemtoReg; //Write from memory to register signal
reg IDEXMemWrite; //Write to memory signal
reg IDEXBranch; //Branch signalwire [15:0] IDSignExt; // Sign extension

//----------------------------------------------
// Variables in the EX stage
wire [15:0] ALUMUXOutput;		// Possible data source for ALU
wire [15:0] aluout1;		// OUTPUT OF ALU
wire [15:0] EXBranchAddr; //Branch address 
wire [2:0] ALUSelect;
wire [2:0] EXWriteAddr;
wire aluzero;
//----------------------------------------------
// Variables in the EX/MEM pipeline register 
reg [15:0] EXMEMALUOut;
reg [15:0] EXMEMBranchAddr;
reg [15:0] EXMEMRegRead2; 
reg [15:0] EXMEMPCPlus2;
reg [15:0] EXMEMInstr; // instruction
reg [2:0] EXMEMWriteAddr;
reg EXMEMMemtoReg;
reg EXMEMMemRead;
reg EXMEMMemWrite;
reg EXMEMRegWrite;
reg EXMEMBranch;
reg EXMEMALUZero;

// MEM/WB Memory Write Back stage
reg [15:0] MEMWBMemReadData;
reg [15:0] MEMWBALUOut;
reg [2:0] MEMWBWriteAddr;
reg MEMWBRegWrite;
reg MEMWBMemtoReg;

/* ----------END Buffer Stages----------------*/

//------------------------------------------------
/* --------------------DEBUG---------------------*/

assign debug = IFIDInstr;
assign probe1 = EXMEMALUZero; 
assign probe2 = IDEXALUOp;
assign probe3 = ALUSelect;	
assign probe4 = IDEXInstr[3:0];
assign probe5 = IDEXRegRead1;
assign probe6 = IFIDRegfield1;
assign probe7 = IDEXRegRead2;
assign probe8 = IFIDRegfield2;
assign probe9 = IFIDConst;
assign probe10 = wdata;
assign probe11 = EXMEMWriteAddr; // MEMWBWriteAddr
assign probe12 = IFIDInstr; //Original IFIDInstr SignExt
assign probe13 = MEMWBALUOut;
assign probe14 = MEMWBRegWrite;
assign probe15 = IDEXRegRead1;
assign probe16 = ALUMUXOutput;
assign probe17 = ALUSrc;
assign probe18 = ALUMUXOutput;
assign probe19 = PCSrc;
assign probe20 = EXMEMALUZero;
assign probe21 = EXMEMBranch;
assign probe22 = EXMEMPCPlus2;
assign probe23 = PC;
assign probe24 = IFIDInstr;

wire [15:0] regf0;
wire [15:0] regf1;
wire [15:0] regf2;
wire [15:0] regf3;
wire [15:0] regf4;
wire [15:0] regf5;
wire [15:0] regf6;
wire [15:0] regf7;

assign reg0 = regf0;
assign reg1 = regf1;
assign reg2 = regf2;
assign reg3 = regf3;
assign reg4 = regf4;
assign reg5 = regf5;
assign reg6 = regf6;
assign reg7 = regf7;

wire ccode;
//------------------------------------------------

wire [15:0] PCMUXOut;

//------------------ IF Stage and PC logic --------------------

assign PCPlus2 = PC + 2; // This is the adder circuit near the PC


MUX_PC PC_MUX(
	PCMUXOut,
	PCPlus2,	   // 0 Adder
	PC,	   // 1 Stalling
	PCStall			
	);

always @(posedge clock)
	begin
	if (reset == 1) 	
		PC <= 0;
	else if (PCSrc == 1) 
		PC <= EXMEMPCPlus2;
	else
		PC <= PCMUXOut;
	end

assign imemaddr = PC; // PC = instruction memory address
	
//------------------ IF/ID Pipeline Register---------------------

always @(posedge clock)
	begin
	if (reset == 1)
		begin
		IFIDInstr <= 0; //normally 0
		IFIDPCPlus2 <= 0;
		end
	else
		begin
		IFIDPCPlus2 <= PCPlus2;
		IFIDInstr <= imemrdata;
		end
	end

assign IFIDOpcode = IFIDInstr[15:13]; //First 3 bits, OpCode
assign IFIDRegfield1 = IFIDInstr[12:10]; //Next 3 bits 
assign IFIDRegfield2 = IFIDInstr[9:7]; //Next 3 Bits
assign IFIDRegfield3 = IFIDInstr[6:4]; // Next 3 Bits
assign IFIDConst = IFIDInstr[6:0]; //Next 7 Bits

//---------------------------- ID Stage ------------------------------
assign negclock = ~clock;  // Reg file is synchronized to pos clock edge, so we supply inverted clock

 RegFile rfile1(
 	rdata1,	// read data output 1
	rdata2,	// read data output 2
	negclock,		// use negative clock edge
	wdata,			// write data input
	MEMWBWriteAddr,			// write address
	IFIDRegfield1,	// read address 1
	IFIDRegfield2,	// read address 2
	MEMWBRegWrite	// write enable
	);			

assign IFIDSignExt = {{9{IFIDInstr[6]}},IFIDInstr[6:0]};

Control cntrol1(
	PCStall,				
	RegWrite,
	RegDst,
	ALUSrc,
	ALUOp,
	Branch,
	MemWrite,
	MemRead,
	MemtoReg,
	clock,			
	IFIDOpcode,	// from the IFID pipeline register	
	reset,
	IFIDInstr //entire instruction goes to control for hazard detection
	);


//---- ID/EX Pipeline Register ------------------------------------------

always @(posedge clock)
	begin
	IDEXPCPlus2 <= IFIDPCPlus2;
	IDEXRegRead1 <= rdata1;
	IDEXRegRead2 <= rdata2;
	IDEXInstr <= IFIDInstr; // I probably don't need the instruction but just in case
	IDEXRegfield2 <= IFIDRegfield2;
	IDEXRegfield3 <= IFIDRegfield3;
	IDEXSignExtend <= IFIDSignExt;
	IDEXALUSrc <= ALUSrc;
	IDEXALUOp <= ALUOp;
	IDEXRegDst <= RegDst;
	IDEXRegWrite <= RegWrite;
	IDEXMemRead <= MemRead;
	IDEXMemWrite <= MemWrite;
	IDEXMemtoReg <= MemtoReg;
	IDEXBranch <= Branch;
	end

//----------------------------- EXMEM Stage --------------------------------

MUX2_3bit RegDstMux(
	EXWriteAddr,		// 3-bit Write Address
	IDEXRegfield2,	   // $rt
	IDEXRegfield3,	   // $rd
	IDEXRegDst			// RegDst Mux 0:$rt, 1:$rd
	);

MUX2 alumux( // ALU multiplexer
	ALUMUXOutput,			// RESULT of ALU MUX
	IDEXRegRead2,	// Register Field
	IDEXSignExtend,	
	IDEXALUSrc		
	);	

ALU alu1(
	aluout1,			// 16-bit output from the ALU
	aluzero,			// equals 1 if the result is 0, and 0 otherwise
	IDEXRegRead1,	// data input
	ALUMUXOutput,			// data input
	ALUSelect			// 3-bit select
	);		

ALUControl alucntrl1( 
	ALUSelect,		// Output to the select of the ALU
	IDEXALUOp,			// From the Control
	IDEXInstr[3:0]		// Function field of the instruction
	);

assign aluresult = aluout1; // Connect the alu with the outside world
assign EXBranchAddr = (IDEXSignExtend << 1) + IDEXPCPlus2; //Branch Address

//----------------- EX/MEM pipeline register ---------------------------

always @(posedge clock)
 	begin
	EXMEMALUOut <= aluout1;
	EXMEMALUZero <= aluzero;
	EXMEMMemtoReg <= IDEXMemtoReg;
	EXMEMMemRead <= IDEXMemRead;
	EXMEMMemWrite <= IDEXMemWrite;
	EXMEMRegWrite <= IDEXRegWrite;
	EXMEMBranch <= IDEXBranch;
	EXMEMRegRead2 <= IDEXRegRead2;
	EXMEMWriteAddr <= EXWriteAddr;
	EXMEMPCPlus2 <= EXBranchAddr;
	end

//---------------------------- MEM Stage -------------------------------
assign PCSrc = EXMEMBranch&EXMEMALUZero;
assign dmemaddr = EXMEMALUOut;
assign dmemwdata = EXMEMRegRead2;
assign dmemwrite = EXMEMMemWrite;	
assign dmemread = EXMEMMemRead;	

//--------------------- MEM/WB pipeline register ---------------------

always @(posedge clock)
 	begin
	MEMWBMemReadData <= dmemrdata;
	MEMWBALUOut <= EXMEMALUOut;
	MEMWBWriteAddr <= EXMEMWriteAddr;
	MEMWBMemtoReg <= EXMEMMemtoReg;
	MEMWBRegWrite <= EXMEMRegWrite;
	end

//----------------------- WB Stage -----------------------------------

MUX2 WriteBackMux(
	wdata,
	MEMWBALUOut,	
	MEMWBMemReadData,
	MEMWBMemtoReg		
	);	
	
endmodule
