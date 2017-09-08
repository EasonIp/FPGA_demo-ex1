
module ex20(
				clk,rst_n,
				adc_data,adc_cs_n,adc_clk,
			);
input clk;	
input rst_n;	
input adc_data;																
output adc_cs_n;															
output adc_clk;																

//---------------------------------------------------						
reg[5:0] cntus;																

always @(posedge clk or negedge rst_n)
	if(!rst_n) cntus <= 6'd0;
	else if((cntus < 6'd49) && (cstate != IDLE)) cntus <= cntus+1'b1;
	else cntus <= 6'd0;

wire dchag_flag = (cntus == 6'd0);											
wire dlock_flag = (cntus == 6'd24);											

//---------------------------------------------------						
parameter	IDLE	= 3'd0,
			TSUDL	= 3'd1,
			START	= 3'd2,
			DTRAN	= 3'd3,
			STOP	= 3'd4,
			TWHDL	= 3'd5;

reg[2:0] bitnum;															
reg[4:0] d17uscnt;															
reg[7:0] adc_dinr;															
reg[7:0] adc_dinlock;														
reg[2:0] cstate,nstate;														
	
always @(posedge clk or negedge rst_n)										
	if(!rst_n) cstate <= IDLE;
	else cstate <= nstate;

always @(posedge clk or negedge rst_n) 										
	if(!rst_n) bitnum <= 3'd0;
	else if(nstate == IDLE) bitnum <= 3'd7;		
	else if((nstate == DTRAN) && dlock_flag) bitnum <= bitnum-1'b1;

always @(posedge clk or negedge rst_n)										
	if(!rst_n) d17uscnt <= 5'd0;
	else if((nstate == TWHDL) && dchag_flag) d17uscnt <= d17uscnt+1'b1;
	else if(nstate == IDLE) d17uscnt <= 5'd0;	
	
always @(cstate or dchag_flag or bitnum or d17uscnt)						
	case(cstate)
		IDLE: 	nstate <= TSUDL;
		TSUDL:	if(dchag_flag) nstate <= START;
				else nstate <= TSUDL;
		START:	if(dchag_flag) nstate <= DTRAN;
				else nstate <= START;
		DTRAN:	if(dchag_flag && (bitnum == 3'd7)) nstate <= STOP;
				else nstate <= DTRAN;
		STOP:	if(dchag_flag) nstate <= TWHDL;
				else nstate <= STOP;
		TWHDL:	if(dchag_flag && (d17uscnt == 5'd18)) nstate <= IDLE;
				else nstate <= TWHDL;
		default: nstate <= IDLE;
		endcase

always @(posedge clk or negedge rst_n)										
	if(!rst_n) adc_dinlock <= 8'h00;
	else if((nstate == DTRAN) && dlock_flag) adc_dinlock[bitnum] <= adc_data;

always @(posedge clk or negedge rst_n)										
	if(!rst_n) adc_dinr <= 8'h00;
	else if(nstate == STOP) adc_dinr <= adc_dinlock;	

assign adc_cs_n = ~((cstate == DTRAN) | (cstate == START) | (cstate == TSUDL));

//---------------------------------------------------						
reg adc_clkr; 

always @(posedge clk or negedge rst_n)
	if(!rst_n) adc_clkr <= 1'b0;
	else if((nstate == DTRAN) && (cntus > 5'd12)) adc_clkr <= 1'b1; 
	else adc_clkr <= 1'b0;

assign adc_clk = adc_clkr;

//---------------------------------------------------						
mydebug	mydebug_inst (
	.probe ( adc_dinr ),
	.source (  )
	);

endmodule
