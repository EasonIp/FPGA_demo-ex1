module ex6(	
				clk,rst_n,
				lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b
			);
input clk;		
input rst_n;
//---------------------------------------------								
output lcd_en;																
output lcd_clk;		
output lcd_hsy;	
output lcd_vsy;	
output[4:0] lcd_db_r;
output[5:0] lcd_db_g;
output[4:0] lcd_db_b;

//---------------------------------------------								
assign lcd_en = 1'b1;

//---------------------------------------------								
reg[1:0] sft_cnt;

always @(posedge clk or negedge rst_n)
	if(!rst_n) sft_cnt <= 2'd0;
	else sft_cnt <= sft_cnt+1'b1;

assign lcd_clk = sft_cnt[1];												
wire dchange = (sft_cnt == 2'd2);											

//---------------------------------------------		
reg[8:0] x_cnt;	 															
reg[8:0] y_cnt;																

always @(posedge clk or negedge rst_n)										
	if(!rst_n) x_cnt <= 9'd0;
	else if(dchange) begin
		if(x_cnt == 9'd407) x_cnt <= 9'd0;
		else x_cnt <= x_cnt+1'b1;  
	end

always @(posedge clk or negedge rst_n)										
	if(!rst_n) y_cnt <= 9'd0;
	else if(dchange && (x_cnt == 9'd407)) begin
		if(y_cnt == 9'd261) y_cnt <= 9'd0;
		else y_cnt <= y_cnt+1'b1;  
	end	

//--------------------------------------------------
reg valid_yr;																

always @ (posedge clk or negedge rst_n)
	if(!rst_n) valid_yr <= 1'b0;
	else if(y_cnt == 9'd18) valid_yr <= 1'b1;	
	else if(y_cnt == 9'd258) valid_yr <= 1'b0;

reg valid;																	

always @ (posedge clk or negedge rst_n)
	if(!rst_n) valid <= 1'b0;
	else if((x_cnt == 9'd68) && valid_yr) valid <= 1'b1;
	else if((x_cnt == 9'd388) && valid_yr) valid <= 1'b0;
	
//--------------------------------------------------
reg lcd_hsy_r,lcd_vsy_r;	

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) lcd_hsy_r <= 1'b1;								
	else if(x_cnt == 9'd0) lcd_hsy_r <= 1'b0;	
	else if(x_cnt == 9'd30) lcd_hsy_r <= 1'b1;

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) lcd_vsy_r <= 1'b1;							
	else if(y_cnt == 9'd0) lcd_vsy_r <= 1'b0;	
	else if(y_cnt == 9'd3) lcd_vsy_r <= 1'b1;

assign lcd_hsy = lcd_hsy_r;
assign lcd_vsy = lcd_vsy_r;	

//-------------------------------------------------- 
reg[15:0] lcd_db_rgb;														

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) lcd_db_rgb <= 16'd0;
	else if(x_cnt == 9'd68) lcd_db_rgb <= 16'h001f;							
	else if(x_cnt == 9'd387) lcd_db_rgb <= 16'h001f;						
	else if(y_cnt == 9'd18) lcd_db_rgb <= 16'h001f;							
	else if(y_cnt == 9'd257) lcd_db_rgb <= 16'h001f;						
	else  lcd_db_rgb <= 16'd0;

//-------------------------------------------------- 						
assign lcd_db_r = valid ? lcd_db_rgb[15:11]:5'd0;
assign lcd_db_g = valid ? lcd_db_rgb[10:5]:6'd0;
assign lcd_db_b = valid ? lcd_db_rgb[4:0]:5'd0;

endmodule
