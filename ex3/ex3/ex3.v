module ex3(
			clk,rst_n,
			led
		);
input clk;																
input rst_n;															
output reg[7:0] led;															

//-------------------------------------
reg[19:0] cnt;															

always @ (posedge clk or negedge rst_n)									
	if(!rst_n) cnt <= 20'd0;											
	else if(cnt >= 20'd999_999) cnt <= 20'd0;
	else cnt <= cnt+1'b1;																		

//-------------------------------------
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) led <= 8'b1111_1110;
	else if(cnt == 20'd999_999) led <= {led[6:0],led[7]};	
	else ;					

endmodule
