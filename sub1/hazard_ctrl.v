module hazard_ctrl(
	MP, //MisPrediction
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
	PCSrc
	);

output MP;
output PCStall;		

input PCSrc;
input  clock;
input  reset;

reg [2:0]Predict;


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
reg MP;
wire [2:0]IFIDOP;
reg [2:0]EXMEMWriteReg;
reg [2:0]IDEXWriteReg;

assign IFIDOP = IFID[15:13];

always @ (posedge clock)
begin
	if(IFIDOP == 2) //If IFID is BEQ
		begin
			Predict <= 1;
		end
end

always @ (posedge clock)
begin
	case(Predict)
	1: Predict <= 2;
	2: Predict <= 0;
	default: Predict <= 0;
	endcase
end


/* Brand Predictor*/
always @(Predict)
begin
	case(Predict)
	0: MP <= 0;
	1: MP <= 0;
	2:
		begin
			if(PCSrc == 1)
				begin
					MP <= 0;
				end
			else
				begin
					MP <= 1;
				end
		end
	default: MP <= 0;
	endcase
end

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

/*
	ITYPE READ REGISTER = 12:10
	RTYPE READ REGISTERS = 12:10, 9:7
*/

always @(posedge clock)
	begin
		//IFID is R Type 
		if(IDEXWrite == 0 && EXMEMWrite == 0)
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

