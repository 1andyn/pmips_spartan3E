// Program or Instuction Memory
// Program 3
//
// The program access 0xfff0 which is an input port,
// where bit 0 is switch 0 and bit 1 is switch 1.
// The program also accesses 0xfffa which is an
// output port to the 7-segment display.
// Check MIPS-Parts.V for the data memory 
// and IO circuit.

module IM3(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;

reg    [15:0] idata;

always @(iaddr[5:1])
  case(iaddr[5:1])
	0: idata={3'd3,3'd0,3'd3,7'b1110000}; //       addi $3,$0,fff0   # $3=fff0, addr to sw0/display
	1: idata={3'd3,3'd0,3'd4,7'b1111110}; //L0:    addi $4,$0,1111110 # 1111110 displays "0"
	2: idata={3'd5,3'd3,3'd5,7'd0};       //       lw   $5,0($3)     # $5 = IO[fff0], sw0 & sw1
	3: idata={3'd2,3'd5,3'd0,7'd1};       //       beq  $5,$0,Skip0  # offset = 2
	4: idata={3'd3,3'd0,3'd4,7'b0110000}; //       addi $4,$0,0110000 #0110000 displays "1"
	5: idata={3'd6,3'd3,3'd4,7'd10};      //Skip0: sw   $4,10($3)    # IO[fffa] = display
    6: idata={3'd2,3'd0,3'd0,7'b1111010}; //       beq    $0,$0,L0   # Offset = -12
    default: idata=0;
  endcase
  
endmodule