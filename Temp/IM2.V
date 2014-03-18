// Program or Instuction Memory
// Program for Subproject 2
// Multiplies 3 by 5 and the product is in memory location 66
//
module IM2(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;

reg    [15:0] idata;

always @(iaddr[5:1])
  case(iaddr[5:1])
     0: idata={3'd3, 3'd0, 3'd2,7'd3};  	  // L0: addi  $2,$0,3 ,0110000100000011
     1: idata={3'd3, 3'd0, 3'd5,7'd32};  	  //     addi  $5,$0,32,0110001010100000
     2: idata={3'd6, 3'd5, 3'd2,7'd34};  	  //     sw    $2,34($5),110101010010001
     3: idata={3'd5, 3'd5, 3'd4,7'd34};  	  //     lw    $4,34($5)
     4: idata={3'd3, 3'd4, 3'd4,7'd5};        // 	 addi  $4,$4,5
     5: idata={3'd6, 3'd5, 3'd4,7'd34};  	  //     sw    $4,34($5)
     6: idata={3'd5, 3'd5, 3'd4,7'd34};  	  //     lw    $4,34($5)
     7: idata={3'd3, 3'd4, 3'd4,7'd2};  	  //     addi  $4,$4,2
     8: idata={3'd2, 3'd0, 3'd0,7'b1110111};  //     beq   $0,$0,L1
     default: idata=0;
  endcase

endmodule