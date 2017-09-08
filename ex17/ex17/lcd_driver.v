
module lcd_driver(	
				clk,rst_n,
				lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b,
				ram_db,ram_ab
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
	//LCD与字符存储RAM的接口
input[31:0] ram_db;	//RAM数据总线
output[5:0]	ram_ab;	//RAM地址总线

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
	else if(y_cnt == 9'd18) valid_yr <= 1'b1;	
	else if(y_cnt == 9'd258) valid_yr <= 1'b0;

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
	//RAM地址产生
assign ram_ab = y_cnt-(9'd18+9'd88);

//-------------------------------------------------- 
	// LCD色彩信号产生
reg[4:0] tmp_cnt;	//0-31计数，对应一行的32个有效显示位

always @(posedge clk or negedge rst_n)
	if(!rst_n) tmp_cnt <= 5'd0;
	else if(!validr) tmp_cnt <= 5'd0;
	else if((x_cnt >= (9'd67+9'd143)) && (x_cnt <= (9'd67+9'd174)) && dchange) begin
		tmp_cnt <= tmp_cnt+1'b1;
	end
	
reg[15:0] lcd_db_rgb;	// LCD色彩显示寄存器

always @ (posedge clk or negedge rst_n)
	if(!rst_n) lcd_db_rgb <= 16'd0;
	else if((y_cnt >= (9'd18+9'd88)) && (y_cnt <= (9'd18+9'd151)) 
				&& (x_cnt >= (9'd67+9'd144)) && (x_cnt <= (9'd67+9'd175))) begin
		if(dchange) begin	//数字显示区域
			if(ram_db[tmp_cnt]) lcd_db_rgb <= 16'h001f;	//显示蓝色
			else lcd_db_rgb <= 16'hf800;	//显示红色
		end
		else ;
	end
	else  lcd_db_rgb <= 16'd0;

	//r,g,b控制液晶屏颜色显示
assign lcd_db_r = valid ? lcd_db_rgb[15:11]:5'd0;
assign lcd_db_g = valid ? lcd_db_rgb[10:5]:6'd0;
assign lcd_db_b = valid ? lcd_db_rgb[4:0]:5'd0;

endmodule

