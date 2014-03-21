module hazard_ctrl(
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
//	debug,
//	debug1,
//	debug2,
//	debug3,
//	debug4
	);

output PCStall;		
//output [2:0] debug;
//output [2:0] debug1;
//output [2:0] debug2;
//output [2:0] debug3;
//output [2:0] debug4;

input  clock;
input  reset;

//Instruction Registers
input [15:0] IFID;
input [15:0] IDEX;
input [15:0] EXMEM;	
input EXMEMWrite;
input EXMEMRegDst; //Selects Register Written to
input IDEXWrite;
input IDEXRegDst; //Selects Register Written to

reg PCStall;
reg StallCode;
wire [2:0]IFIDOP;
reg [2:0]EXMEMWriteReg;
reg [2:0]IDEXWriteReg;

//assign Regfield2 IFIDInstr[9:7]; REGDST = 0
//assign Regfield3 IFIDInstr[6:4]; REGDST = 1

assign IFIDOP = IFID[15:13];

//Assign Write Addr for EXMEM
always @ (EXMEMRegDst)
	begin
		case(EXMEMRegDst)
		0: EXMEMWriteReg <= EXMEM[9:7];
		1: EXMEMWriteReg <= EXMEM[6:4];
		default: EXMEMWriteReg <= EXMEM[9:7];
		endcase
	end

//Assign Write Addr for IDEX
always @ (IDEXRegDst)
	begin
		case(IDEXRegDst)
		0: IDEXWriteReg <= IDEX[9:7];
		1: IDEXWriteReg <= IDEX[6:4];
		default: IDEXWriteReg <= IDEX[9:7];
		endcase
	end

//assign debug = IDEXWriteReg;
//assign debug1 = EXMEMWriteReg;
//assign debug2 = IFID[12:10];
//assign debug3 = IFID[9:7];
//assign debug4 = IFIDOP;
/*
	ITYPE READ REGISTER = 12:10
	RTYPE READ REGISTERS = 12:10, 9:7
*/

always @(posedge clock)
	begin
		//IFID is R Type STALL BEQ for now
		if(IDEXWrite == 0 && EXMEMWrite == 0 || IDEX[15:13] == 2 || EXMEM [15:13] == 2)
			begin
				StallCode = 0;
			end
		else
		begin
			if(IFIDOP == 0)
				begin
					if(IDEXWrite == 1)
						begin
							if(IFID[12:10] == IDEXWriteReg || IFID[9:7] == IDEXWriteReg)
								begin
									StallCode = 1; //Stall
								end
							else if(EXMEMWrite == 1)
								begin
									if(IFID[12:10] == EXMEMWriteReg || IFID[9:7] == EXMEMWriteReg)
										begin
											StallCode = 1; //Stall
										end
									else
										begin
											StallCode = 0;
										end
								end	
							else
								begin
									StallCode = 0;
								end
						end
					else if(EXMEMWrite == 1)
						begin
							if(IFID[12:10] == EXMEMWriteReg || IFID[9:7] == EXMEMWriteReg)
								begin
									StallCode = 1; //Stall
								end
							else
								begin
									StallCode = 0;
								end
						end
					else
						begin
							StallCode = 0;
						end
				end
				
			//IFID is I Type
			else
				begin
					if(IDEXWrite == 1)
						begin
							if(IFID[12:10] == IDEXWriteReg)
								begin
									StallCode = 1; //Stall
								end
							else if(EXMEMWrite == 1)
								begin
									if(IFID[12:10] == EXMEMWriteReg)
										begin
											StallCode = 1; //Stall
										end
									else
										begin
											StallCode = 0;
										end
								end	
							else
								begin
									StallCode = 0;
								end
						end
					else if(EXMEMWrite == 1)
						begin
							if(IFID[12:10] == EXMEMWriteReg)
								begin
									StallCode = 1; //Stall
								end
							else
								begin
									StallCode = 0;
								end
						end
					else
						begin
							StallCode = 0;
						end
				end
			end
	end

always @ (StallCode or reset)
	begin
		if(reset == 1) PCStall = 1;
		else
		begin
			case(StallCode)
			0: PCStall = 0;
			1: PCStall = 1;
			default: PCStall = 0;
			endcase
		end
	end

endmodule

