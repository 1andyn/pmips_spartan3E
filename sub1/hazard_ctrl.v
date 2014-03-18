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
	);

output PCStall;		

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

//Assign Write Addr for EXMEM
always @ (EXMEMRegDst)
	begin
		case(EXMEMRegDst)
		0: EXMEMWriteReg <= EXMEM[9:7];
		1: EXMEMWriteReg <= EXMEM[6:4];
		default: EXMEMWriteReg <= EXMEM[9:7];
		endcase;
	end

//Assign Write Addr for IDEX
always @ (IDEXRegDst)
	begin
		case(IDEXRegDst)
		0: IDEXWriteReg <= IDEX[9:7];
		1: IDEXWriteReg <= IDEX[6:4];
		default: IDEXWriteReg <= IDEX[9:7];
		endcase;
	end


assign IFIDOP = IFID[15:13];

/*
	ITYPE READ REGISTER = 12:10
	RTYPE READ REGISTERS = 12:10, 9:7
*/

always @(posedge clock)
	begin
		//IFID is R Type
		if(IFIDOP == 2)
			begin
				if(IDEXWrite == 1)
					begin
						if(IFID[12:10] == IDEXWriteReg || IFID[9:7] == IDEXWriteReg)
							begin
								StallCode = 1; //Stall
							end
						else
							begin
								StallCode = 0;
							end
					end
				else if(EXMEMWrite == 1)
						if(IFID[12:10] == EXMEMWriteReg || IFID[9:7] == EXMEMWriteReg)
							begin
								StallCode = 1; //Stall
							end
						else
							begin
								StallCode = 0;
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
						else
							begin
								StallCode = 0;
							end
					end
				else if(EXMEMWrite == 1)
						if(IFID[12:10] == EXMEMWriteReg)
							begin
								StallCode = 1; //Stall
							end
						else
							begin
								StallCode = 0;
							end
				else
					begin
						StallCode = 0;
					end
			end
	end

always @ (StallCode or reset)
	begin
		case(StallCode)
		1: PCStall = 1;
		default: PCStall = 0;
		endcase;
	end

endmodule

