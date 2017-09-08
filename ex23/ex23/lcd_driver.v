
module lcd_driver(	
				clk,rst_n,
				lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b,
				rdfifo_rddb,rdfifo_rdreq,rdfifo_clr
			);
input clk;		//25MHz
input rst_n;	//低电平复位
	// FPGA与LCD接口信号
output lcd_en;	//背光使能信号，高有效
output lcd_clk;	//时钟信号	
output lcd_hsy;	//行同步信号
output lcd_vsy;	//场同步信号
output[4:0] lcd_db_r;
output[5:0] lcd_db_g;
output[4:0] lcd_db_b;
	//LCD与FIFO的接口
input[15:0] rdfifo_rddb;		//FIFO读出数据总线
output rdfifo_rdreq;	//FIFO读请求信号
output rdfifo_clr;		//FIFO复位信号，高电平有效

//---------------------------------------------
assign lcd_en = 1'b1;

//---------------------------------------------
//lcd_clk时钟周期为160ns(6.25MHz),即4个25MHz的时钟周期
reg[1:0] sft_cnt;

always @(posedge clk or negedge rst_n)
	if(!rst_n) sft_cnt <= 2'd0;
	else sft_cnt <= sft_cnt+1'b1;

assign lcd_clk = sft_cnt[1];	//0-1:low,2-3:high

wire dchange = (sft_cnt == 2'd2);	//数据变化标志位，高有效

//---------------------------------------------		
//坐标计数 
//x = 0-407;  y = 0-261
reg[8:0] x_cnt;	//x计数器
reg[8:0] y_cnt;	//y计数器

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
//有效显示标志位产生
reg valid_yr;	//行显示有效信号

	//行显示有效信号
always @ (posedge clk or negedge rst_n)
	if(!rst_n) valid_yr <= 1'b0;
	else if(y_cnt == 9'd16) valid_yr <= 1'b1;	
	else if(y_cnt == 9'd256) valid_yr <= 1'b0;

reg validr,valid;

always @ (posedge clk or negedge rst_n)
	if(!rst_n) validr <= 1'b0;
	else if((x_cnt == 9'd67) && valid_yr) validr <= 1'b1;
	else if((x_cnt == 9'd387) && valid_yr) validr <= 1'b0;
	
always @ (posedge clk or negedge rst_n)
	if(!rst_n) valid <= 1'b0;
	else valid <= validr;
	
//--------------------------------------------------
// LCD场同步,行同步信号
reg lcd_hsy_r,lcd_vsy_r;	//同步信号
 
always @ (posedge clk or negedge rst_n)
	if(!rst_n) lcd_hsy_r <= 1'b1;								
	else if(x_cnt == 9'd0) lcd_hsy_r <= 1'b0;	//产生lcd_hsy信号
	else if(x_cnt == 9'd30) lcd_hsy_r <= 1'b1;

always @ (posedge clk or negedge rst_n)
	if(!rst_n) lcd_vsy_r <= 1'b1;							  
	else if(y_cnt == 9'd0) lcd_vsy_r <= 1'b0;	//产生lcd_vsy信号
	else if(y_cnt == 9'd3) lcd_vsy_r <= 1'b1;

assign lcd_hsy = lcd_hsy_r;
assign lcd_vsy = lcd_vsy_r;	

//--------------------------------------------------
	//FIFO读请求信号和复位信号产生
assign rdfifo_rdreq = validr & (sft_cnt == 2'd3);
assign rdfifo_clr = (y_cnt == 9'd0);

//-------------------------------------------------- 
	// LCD色彩信号产生
reg[15:0] lcd_db_rgb;	// LCD色彩显示寄存器

always @ (posedge clk or negedge rst_n)
	if(!rst_n) lcd_db_rgb <= 16'd0;
	else lcd_db_rgb <= rdfifo_rddb;

	//r,g,b控制液晶屏颜色显示
assign lcd_db_r = valid ? lcd_db_rgb[15:11]:5'd0;
assign lcd_db_g = valid ? lcd_db_rgb[10:5]:6'd0;
assign lcd_db_b = valid ? lcd_db_rgb[4:0]:5'd0;

endmodule

