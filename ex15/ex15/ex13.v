
module ex13(
			clk,rst_n,
			shiftout,shifttaps
		);
input clk;
input rst_n;		
output[7:0]	shiftout;														
output[31:0] shifttaps;														

//////////////////////////////////////////////
reg[7:0] shiftin;															
reg[9:0] cnt;																
reg clken;																	

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else cnt <= cnt+1'b1;
	
always @(posedge clk or negedge rst_n)										
	if(!rst_n) begin
		shiftin <= 8'ha9;
		clken <= 1'b0;
	end
	else if(cnt == 10'd0) begin
		shiftin <= 8'ha9;
		clken <= 1'b0;
	end
	else if((cnt > 10'd0) && (cnt < 10'd33)) begin							
		shiftin <= shiftin+1'b1;
		clken <= 1'b1;
	end
	else if((cnt > 10'd100) && (cnt < 10'd117)) begin						
		shiftin <= shiftin+1'b1;
		clken <= 1'b1;
	end
	else if((cnt > 10'd200) && (cnt < 10'd217)) begin						
		shiftin <= shiftin+1'b1;
		clken <= 1'b1;
	end
else clken <= 1'b0;

//////////////////////////////////////////////								
ex_shiftreg	ex_shiftreg_inst (
	.aclr ( !rst_n ),
	.clken ( clken ),
	.clock ( clk ),
	.shiftin ( shiftin ),
	.shiftout ( shiftout ),
	.taps ( shifttaps )
	);		

endmodule
