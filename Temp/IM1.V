// Program or Instuction Memory
// Program for Subproject 1
// Multiplies 3 by 5 and the product is in $4
//
module IM(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;

reg    [15:0] idata;

always @(iaddr[5:1])
  case(iaddr[5:1])
     0: idata={3'd3, 3'd0, 3'd2,7'd3};  	  // L0: addi  $2,$0,3     ,0110000100000011
     1: idata={3'd0, 3'd0, 3'd0,3'd4, 4'd3};  //     add   $4,$0,$0  ,0000000001000011
     2: idata={3'd2, 3'd2, 3'd0,7'b1111101};  // L1: beq   $2,$0,L0  ,100100001111101
     3: idata={3'd3, 3'd4, 3'd4,7'd5};        // 	 addi  $4,$4,5    ,0111001000000101
     4: idata={3'd3, 3'd2, 3'd2,7'b1111111};  //     addi  $2,$2,-1  ,0110100101111111  
     5: idata={3'd2, 3'd0, 3'd0,7'b1111100};  //     beq   $0,$0,L1  ,0100000001111100
     default: idata=0;
  endcase

endmodule