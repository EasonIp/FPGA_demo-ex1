module ex4(
			clk,rst_n,
			sw,led
		);
input clk;																
input rst_n;	
input[3:1] sw;																
output reg[7:0] led;														

//-------------------------------------
reg[22:0] cnt;																

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) cnt <= 23'd0;											
	else cnt <= cnt+1'b1;																		
//-------------------------------------
always @ (posedge clk or negedge rst_n) 									
	if(!rst_n) led <= 8'b1111_1110;
	else if(cnt == 23'h7fffff) begin										
		if(!sw[1]) led <= {led[6:0],led[7]};								
		else if(!sw[2]) led <= {led[0],led[7:1]};							
		else if(!sw[3]) led <= ~led;										
		else ;
	end
	else ;					

endmodule
