module ex17(	
				clk,rst_n,
				lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b
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

//---------------------------------------------
	//LCD与字符存储RAM的接口
wire[31:0] ram_db;	//RAM数据总线
wire[5:0] ram_ab;	//RAM地址总线

//---------------------------------------------
	//RAM例化，该RAM中存储一个32*64的ASCII字符的字模
myram	myram_inst (
	.address ( ram_ab ),
	.clock ( clk ),
	.data ( 32'd0 ),
	.wren ( 1'b0 ),
	.q ( ram_db )
	);

//---------------------------------------------
	//LCD显示驱动模块
lcd_driver	uut_lcd_driver(	
				.clk(clk),
				.rst_n(rst_n),
				.lcd_en(lcd_en),
				.lcd_clk(lcd_clk),
				.lcd_hsy(lcd_hsy),
				.lcd_vsy(lcd_vsy),
				.lcd_db_r(lcd_db_r),
				.lcd_db_g(lcd_db_g),
				.lcd_db_b(lcd_db_b),
				.ram_db(ram_db),
				.ram_ab(ram_ab)
			);
		
endmodule


