// Program or Instuction Memory
// Program for Subproject 1
// Multiplies 3 by 5 and the product is in $4
//
module IM(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;

reg    [15:0] idata;

always @(iaddr[3:1])
  case(iaddr[3:1])
     0: idata={3'd3, 3'd0, 3'd2,7'd3};  	  // L0: addi  $2,$0,3
     1: idata={3'd0, 3'd0, 3'd0,3'd4, 4'd3};  //     add   $4,$0,$0
     2: idata={3'd2, 3'd2, 3'd0,7'b1111101};  // L1: beq   $2,$0,L0
     3: idata={3'd3, 3'd4, 3'd4,7'd5};        // 	 addi  $4,$4,5
     4: idata={3'd3, 3'd2, 3'd2,7'b1111111};  //     addi  $2,$2,-1
     5: idata={3'd2, 3'd0, 3'd0,7'b1111100};  //     beq   $0,$0,L1
     default: idata=0;
  endcase

endmodule