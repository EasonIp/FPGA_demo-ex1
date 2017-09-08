module ex9(
				clk,rst_n,
				trig,echo,
				beep
			);
input clk;		
input rst_n;	
output trig;	
input echo;	
output reg beep;
	
//---------------------------------------------------
reg[19:0] cnt;

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 20'd0;
	else cnt <= cnt+1'b1;
	
assign trig = (cnt < 20'd26_000) ? 1'b1:1'b0;


//---------------------------------------------------
reg[1:0] echo_r;
reg[19:0] pulse;

always @(posedge clk or negedge rst_n)
	if(!rst_n) echo_r <= 2'b00;
	else echo_r <= {echo_r[0],echo};

always @(posedge clk or negedge rst_n)
	if(!rst_n) pulse <= 20'd0;
	else if(cnt == 20'd10) pulse <= 20'd0;
	else if(echo_r[1]) pulse <= pulse+1'b1;
	else ;
	
reg[19:0] pulse_r;	
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) pulse_r <= 20'd0;
	else if(cnt == 20'd1) pulse_r <= pulse;
	
//---------------------------------------------------
reg[25:0] bcnt;	
reg[25:0] bcyc;	

always @(posedge clk or negedge rst_n)
	if(!rst_n) bcnt <= 26'd0;
	else if(bcnt < bcyc) bcnt <= bcnt+1'b1;
	else bcnt <= 26'd0;

always @(posedge clk or negedge rst_n)
	if(!rst_n) beep <= 1'b0;
	else if(pulse_r <= 20'd58824) begin
		bcyc <= 26'd12_500000;
		beep <= 1'b1;
	end
	else if((pulse_r > 20'd58824) && (pulse_r <= 20'd110294)) begin
		bcyc <= 26'd12_500000;
		if(bcnt < 10_00000) beep <= 1'b1;
		else beep <= 1'b0;
	end
	else if((pulse_r > 20'd110294) && (pulse_r <= 20'd183823)) begin
		bcyc <= 26'd25_000000;
		if(bcnt < 10_00000) beep <= 1'b1;
		else beep <= 1'b0;
	end
	else if((pulse_r > 20'd183823) && (pulse_r <= 20'd294118)) begin
		bcyc <= 26'd50_000000;
		if(bcnt < 10_00000) beep <= 1'b1;
		else beep <= 1'b0;		
	end
	else beep <= 1'b0;
	
endmodule
