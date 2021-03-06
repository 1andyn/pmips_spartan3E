// Program or Instuction Memory
// Test JUMP AND LINK
module IM5(idata,iaddr);

output [15:0] idata;
input  [15:0] iaddr;
reg    [15:0] idata;

always @(iaddr[3:1])
  case(iaddr[3:1])
     0: idata={3'd3, 3'd0, 3'd1,7'd3};  	 	 //  addi  $1,$0,3 //0
     1: idata={3'd3, 3'd0, 3'd2,7'd3};  	 	 // L0 addi  $2,$0,3//2
     2: idata={3'd3, 3'd0, 3'd3,7'd8};  	  	 // addi  $3,$0,8 //4
     3: idata={3'd0, 3'd0, 3'd0,3'd4, 4'd3};  //     add   $4,$0,$0 //6
     4: idata={3'd1, 3'd0, 3'd0,7'd0};  		 // L1: jal   L0
     5: idata={3'd3, 3'd4, 3'd4,7'd5};        // 	 addi  $4,$4,5 //10
     6: idata={3'd3, 3'd2, 3'd2,7'b1111111};  //     addi  $2,$2,-1 //12

     default: idata=0;
  endcase

endmodule