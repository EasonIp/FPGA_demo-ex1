module ex21(
				clk,rst_n,
				scl,sda
			);
input clk;		
input rst_n;	
output scl;	
inout sda;	

//---------------------------------------------------						
wire[7:0] dac_data;															
	
mydebug	mydebug_inst (
	.probe ( ),
	.source ( dac_data )
	);

//---------------------------------------------------						
reg[7:0] dac_datar;	
reg dac_en;																	

always @(posedge clk or negedge rst_n)										
	if(!rst_n) dac_datar <= 8'd0;
	else dac_datar <= dac_data;

always @(posedge clk or negedge rst_n)										
	if(!rst_n) dac_en <= 1'b0;
	else if(dac_datar != dac_data) dac_en <= 1'b1;
	else dac_en <= 1'b0;

//---------------------------------------------------						
reg[8:0] cnti;																

always @(posedge clk or negedge rst_n)										
	if(!rst_n) cnti <= 9'd0;
	else if(cnti < 9'd499 && cstate != IDLE) cnti <= cnti + 1'b1;
	else cnti <= 9'd0;

wire scl_low = (cnti == 9'd374);											
wire scl_high = (cnti == 9'd124);											

assign scl = ~cnti[8];														

//---------------------------------------------------
parameter IDLE		= 4'd0;
parameter START		= 4'd1;
parameter ADDR		= 4'd2;
parameter ACK1		= 4'd3;
parameter CMSB		= 4'd4;
parameter ACK2		= 4'd5;
parameter LSBI		= 4'd6;
parameter ACK3		= 4'd7;
parameter ACK4		= 4'd8;
parameter STOP		= 4'd9;

parameter DEVICE_ADDR	= 8'b1001_1000;										
wire[7:0] dac_mdata = {4'b0000,dac_data[7:4]};	
wire[7:0] dac_ldata = {dac_data[3:0],4'b0000};	

reg[3:0] cstate,nstate;	
reg sdar;	
reg[2:0] bcnt;																
reg sdlink;																	

always @(posedge clk or negedge rst_n)
	if(!rst_n) cstate <= IDLE;
	else cstate <= nstate;
	
always @(cstate or dac_en or scl_high or scl_low or bcnt) begin				
	case(cstate)
		IDLE: 	if(dac_en) nstate <= START;
				else nstate <= IDLE;
		START:  if(scl_high) nstate <= ADDR;
				else nstate <= START;
		ADDR: 	if(scl_low && bcnt == 3'd0) nstate <= ACK1;
				else nstate <= ADDR;
		ACK1: 	if(scl_low) nstate <= CMSB;
				else nstate <= ACK1;
		CMSB: 	if(scl_low && bcnt == 3'd0) nstate <= ACK2;
				else nstate <= CMSB;
		ACK2: 	if(scl_low) nstate <= LSBI;
				else nstate <= ACK2;
		LSBI:	if(scl_low && bcnt == 3'd0) nstate <= ACK3;
				else nstate <= LSBI;
		ACK3: 	if(scl_low) nstate <= ACK4;
				else nstate <= ACK3;
		ACK4: 	if(scl_low) nstate <= STOP;
				else nstate <= ACK4;				
		STOP: 	if(scl_high) nstate <= IDLE;
				else nstate <= STOP;
		default: nstate <= IDLE;
		endcase
end

always @(posedge clk or negedge rst_n)										
	if(!rst_n) begin
			sdar <= 1'b1;
			sdlink <= 1'b1;
		end
	else begin
		case(cstate)
			IDLE: begin
					sdar <= 1'b1;
					sdlink <= 1'b1;	
				end
			START: 	if(scl_high) begin
					sdar <= 1'b0;
					sdlink <= 1'b1;	
				end			
			ADDR: if(scl_low) begin
					sdar <= DEVICE_ADDR[bcnt];	
					sdlink <= 1'b1;	
				end					
			CMSB: if(scl_low) begin 
					sdar <= dac_mdata[bcnt];	
					sdlink <= 1'b1;	
				end
			LSBI: if(scl_low) begin
					sdar <= dac_ldata[bcnt];	
					sdlink <= 1'b1;	
				end
			ACK1,ACK2,ACK3: if(scl_low) begin
					sdar <= 1'b0;
					sdlink <= 1'b0;	
				end
			ACK4: if(scl_low) begin
					sdar <= 1'b0;
					sdlink <= 1'b1;	
				end
			STOP: if(scl_high) begin 
					sdar <= 1'b1;
					sdlink <= 1'b1;	
				end
			default: ;
			endcase
		end
	
assign sda = sdlink ? sdar : 1'bz;											

always @(posedge clk or negedge rst_n)										
	if(!rst_n) bcnt <= 3'd0;
	else begin
		case(cstate)
			ADDR,CMSB,LSBI:	begin
					if(scl_low) bcnt <= bcnt-1'b1;
					else ;
				end
			default: bcnt <= 3'd7;
			endcase
		end

endmodule
