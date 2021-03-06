// Program or Instuction Memory
// Program for Subproject 1
// Multiplies 3 by 5 and the product is in $4
//
module IM4(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;

reg    [15:0] idata;

always @(iaddr[3:1])
  case(iaddr[3:1])
     0: idata={3'd3, 3'd0, 3'd5,7'd32};  	  //     addi  $5,$0,32,0110001010100000
     1: idata={3'd3, 3'd0, 3'd2,7'd3};  	  // L0: addi  $2,$0,3 ,0110000100000011
     2: idata={3'd6, 3'd5, 3'd2,7'd34};  	  //     sw    $2,34($5),1101010100100010
     3: idata={3'd5, 3'd5, 3'd4,7'd34};  	  //     lw    $4,34($5),1011011000100010
     4: idata={3'd3, 3'd4, 3'd4,7'd5};        // 	 addi  $4,$4,5,0111001000000101
     default: idata=2;
  endcase

endmodule