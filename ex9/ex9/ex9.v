module ex9(
				clk,rst_n,
				trig,echo
			);
input clk;		
input rst_n;	
output trig;																
input echo;																	

//---------------------------------------------------						
reg[25:0] cnt;	

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 26'd0;
	else cnt <= cnt+1'b1;
	
assign trig = (cnt < 24'd26_000) ? 1'b1:1'b0;								

//---------------------------------------------------						
reg[1:0] echo_r;															
reg[23:0] pulse;															

always @(posedge clk or negedge rst_n)										
	if(!rst_n) echo_r <= 2'b00;
	else echo_r <= {echo_r[0],echo};

always @(posedge clk or negedge rst_n)										
	if(!rst_n) pulse <= 24'd0;
	else if(cnt == 26'd10) pulse <= 24'd0;
	else if(echo_r[1]) pulse <= pulse+1'b1;
	else ;
	
reg[23:0] pulse_r;															
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) pulse_r <= 24'd0;
	else if(cnt == 26'd1) pulse_r <= pulse;
	
//---------------------------------------------------						
mydebug	mydebug_inst (
	.probe ( pulse_r ),
	.source (  )
	);

endmodule
