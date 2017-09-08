

module ex1(
			clk,rst_n,led
		);

input clk;
input rst_n;
output led;

reg[23:0] cnt;

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 24'd0;
	else cnt <= cnt+1'b1;
	
assign led = cnt[23];


endmodule






