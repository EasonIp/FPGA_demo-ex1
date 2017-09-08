module ex2(
			clk,rst_n,
			fm
		);
input clk;																
input rst_n;															
output reg fm;															

//-------------------------------------
reg[19:0] cnt;															

always @ (posedge clk or negedge rst_n)									
	if(!rst_n) cnt <= 20'd0;											
	else if(cnt < 20'd999_999) cnt <= cnt+1'b1;							
	else cnt <= 20'd0;													

//-------------------------------------
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) fm <= 1'b0;
	else if(cnt < 20'd500_000) fm <= 1'b1;	
	else fm <= 1'b0;						

endmodule
