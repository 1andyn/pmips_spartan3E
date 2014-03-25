module PMIPSL1(
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
	stage
	);

/* Outputs */
output [15:0] imemaddr; //16bit register for PC Instruction memory
output [15:0] dmemaddr; //Data memory address for ALU results [EXMEM]
output [15:0] dmemwdata; // Data Memory Data; reading data
output [15:0] aluresult; // Debug Output	
output dmemwrite;	// write 2 memory enable
output dmemread;	// read memory enable
output stall;
output debug8;
output [2:0] Predict;
output [3:0] stage;
//output probe15; //aluzero

output debug;

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
wire [2:0]RegWriteLoc;

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
wire Flush;
wire aluzero;
//----------------------------------------------
// Variables in the EX/MEM pipeline register 
reg [15:0] EXMEMALUOut;
reg [15:0] EXMEMBranchAddr;
reg [15:0] EXMEMRegRead2; 
reg [15:0] EXMEMPCPlus2;
reg [15:0] EXMEMInstr; // instruction
reg [2:0] EXMEMWriteAddr;
reg [2:0] EXMEMRegfield2;
reg [2:0] EXMEMRegfield3;
reg EXMEMMemtoReg;
reg EXMEMMemRead;
reg EXMEMMemWrite;
reg EXMEMRegWrite;
reg EXMEMBranch;
reg EXMEMALUZero;
reg EXMEMRegDst;

// MEM/WB Memory Write Back stage
reg [15:0] MEMWBMemReadData;
reg [15:0] MEMWBALUOut;
reg [2:0] MEMWBWriteAddr;
reg [2:0] MEMWBRegfield2;
reg [2:0] MEMWBRegfield3;
reg MEMWBRegWrite;
reg MEMWBMemtoReg;
reg MEMWBRegDst;
reg MEMWBWrite;

/* ----------END Buffer Stages----------------*/

//------------------------------------------------
/* --------------------DEBUG---------------------*/

output [15:0]debug7;
output [15:0]debug2;
output [15:0]debug3;
output [15:0]debug4;
output debug5;
output [15:0]debug6;
assign debug8 = PCStall;
assign debug7 = EXMEMALUOut;
assign debug6 = EXMEMRegRead2;
assign debug5 = EXMEMMemWrite;
assign debug4 = EXMEMInstr;
assign debug2 = IFIDInstr;
assign debug3 = IDEXInstr;
assign debug = PCSrc;
assign stall = Flush;

//------------------------------------------------

wire [15:0] PCMUXOut;
wire [15:0] NEXTPC;
reg [15:0] ori;

//------------------ IF Stage and PC logic --------------------

assign PCPlus2 = PC + 2; // This is the adder circuit near the PC
assign imemaddr = PC; // PC = instruction memory address

MUX_PC PC_MUX(
	PCMUXOut,
	PCPlus2,	   // 0 Adder
	PC,	   // 1 Stalling
	PCStall			
	);

wire [15:0] sign_ext;
assign sign_ext = {{9{imemrdata[6]}},imemrdata[6:0]};	
assign NEXTPC = (sign_ext << 1) + PCPlus2; //Branch Address
wire [15:0] jmp;
assign jmp = {{3{imemrdata[12]}},imemrdata[12:0]};

always @(posedge clock)
	begin
	if (reset == 1) 	
		PC <= 0;
		/* This is for Branch TAKEN
	else if (imemrdata[15:13] == 2 && PCStall == 0) 
		begin
			PC <= NEXTPC;
			ori <= PCMUXOut;
		end*/
	else if(PCSrc == 1)
		begin
			PC <= EXBranchAddr;
		end
	else if(imemrdata[15:13] == 7)
		begin
			PC <= jmp;
		end
		/* Bracn Taken only
	else if (Flush == 1)
		PC <= ori;*/
	else
		PC <= PCMUXOut;
	end


//------------------ IF/ID Pipeline Register---------------------

always @(posedge clock)
	begin
	if (reset == 1)
		begin
		IFIDInstr <= 0;
		IFIDPCPlus2 <= 0;
		end
	else
		begin
		if(PCStall == 1)
			begin
				IFIDInstr <= IFIDInstr;
				IFIDPCPlus2 <= IFIDPCPlus2;
			end
		else
			begin
				IFIDPCPlus2 <= PCPlus2;
				IFIDInstr <= imemrdata;
			end
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
	RegWriteLoc,			// write address
	IFIDRegfield1,	// read address 1
	IFIDRegfield2,	// read address 2
	MEMWBRegWrite	// write enable
	);			

assign IFIDSignExt = {{9{IFIDInstr[6]}},IFIDInstr[6:0]};

hazard_ctrl hzc(
	Flush,
	PCStall,		// if asserted it will stall the PC (hold value)
	clock,			// Clock input signal
	reset,			// Used to clear controller
	IFIDInstr, //entire instruction goes to control for hazard detection
	IDEXInstr,
	EXMEMInstr,
	EXMEMRegWrite,
	EXMEMRegDst,
	IDEXRegWrite,
	IDEXRegDst,
	PCSrc,
	Predict,
	stage
	);

new_control cntrol(			
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
	IFIDInstr,
	reset
	);


//---- ID/EX Pipeline Register ------------------------------------------

always @(posedge clock)
	begin
		if(PCStall == 1 || Flush)
			begin
				IDEXInstr <= 16'b0000000000000000;
				IDEXRegRead1 <= 0;
				IDEXRegRead2 <= 0;
				IDEXRegfield2 <= 0;
				IDEXRegfield3 <= 0;
				IDEXSignExtend <= 0;
				IDEXALUSrc <= 0;
				IDEXALUOp <= 0;
				IDEXRegDst <= 0;
				IDEXRegWrite <= 0;
				IDEXMemRead <= 0;
				IDEXMemWrite <= 0;
				IDEXMemtoReg <= 0;
				IDEXBranch <= 0;
			end
		else
			begin
				IDEXPCPlus2 <= IFIDPCPlus2;
				IDEXRegRead1 <= rdata1;
				IDEXRegRead2 <= rdata2;
				IDEXInstr <= IFIDInstr; 
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
	end

//----------------------------- EXMEM Stage --------------------------------

MUX2_3bit RegDstMux(
	RegWriteLoc,		// 3-bit Write Address
	MEMWBRegfield2,	   // $rt
	MEMWBRegfield3,	   // $rd
	MEMWBRegDst			// RegDst Mux 0:$rt, 1:$rd
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
		if(reset == 1 || Flush)
			begin
				EXMEMRegWrite <= 0;
				EXMEMInstr <= 16'b0000000000000000;
				EXMEMRegRead2 <= 0;
				EXMEMRegfield2 <= 0;
				EXMEMRegfield3 <= 0;
				EXMEMRegDst <= 0;
				EXMEMRegWrite <= 0;
				EXMEMMemRead <= 0;
				EXMEMMemWrite <= 0;
				EXMEMMemtoReg <= 0;
				EXMEMBranch <= 0;
			end
		else
			begin
				EXMEMInstr <= IDEXInstr;
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
				EXMEMRegDst <= IDEXRegDst;
				EXMEMRegfield2 <= IDEXRegfield2;
				EXMEMRegfield3 <= IDEXRegfield3;
			end
	end

//---------------------------- MEM Stage -------------------------------
assign PCSrc = EXMEMBranch & EXMEMALUZero;
assign dmemaddr = EXMEMALUOut;
assign dmemwdata = EXMEMRegRead2;
assign dmemwrite = EXMEMMemWrite;	
assign dmemread = EXMEMMemRead;	

//--------------------- MEM/WB pipeline register ---------------------

always @(posedge clock)
 	begin
		if(reset == 1)
			begin
				MEMWBRegWrite <= 0;
			end
		else
			begin
				MEMWBMemReadData <= dmemrdata;
				MEMWBALUOut <= EXMEMALUOut;
				MEMWBWriteAddr <= EXMEMWriteAddr;
				MEMWBMemtoReg <= EXMEMMemtoReg;
				MEMWBRegWrite <= EXMEMRegWrite;
				MEMWBRegDst <= EXMEMRegDst;
				MEMWBRegfield2 <= EXMEMRegfield2;
				MEMWBRegfield3 <= EXMEMRegfield3;
			end
	end

//----------------------- WB Stage -----------------------------------

MUX2 WriteBackMux(
	wdata,
	MEMWBALUOut,	
	MEMWBMemReadData,
	MEMWBMemtoReg		
	);	
	
endmodule
