
module ex12(
			clk,rst_n,led
		);

input clk;
input rst_n;
output led;

wire clk_1m;
wire lock;

my_pll	my_pll_inst (
	.areset ( !rst_n ),
	.inclk0 ( clk ),
	.c0 ( clk_1m ),
	.locked ( lock )
	);

reg[19:0] cnt;

always @(posedge clk_1m or negedge rst_n)
	if(!rst_n) cnt <= 20'd0;
	else if(lock) cnt <= cnt+1'b1;
	
assign led = cnt[19];

endmodule

