module ex23(
			clk,rst_n,
			lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b,
			sdram_clk,sdram_cke,sdram_cs_n,sdram_ras_n,sdram_cas_n,sdram_we_n,
			sdram_ba,sdram_addr,sdram_data,
			vpclk,vvsync,vhref,vdb,vxclk,vscl,vsda
		);
input clk;
input rst_n;
	// FPGA与LCD接口信号
output lcd_en;	//背光使能信号，高有效
output lcd_clk;	//时钟信号	
output lcd_hsy;	//行同步信号
output lcd_vsy;	//场同步信号
output[4:0] lcd_db_r;
output[5:0] lcd_db_g;
output[4:0] lcd_db_b;
	// FPGA与SDRAM硬件接口
output sdram_clk;			//	SDRAM时钟信号
output sdram_cke;			//  SDRAM时钟有效信号
output sdram_cs_n;			//	SDRAM片选信号
output sdram_ras_n;			//	SDRAM行地址选通脉冲
output sdram_cas_n;			//	SDRAM列地址选通脉冲
output sdram_we_n;			//	SDRAM写允许位
output[1:0] sdram_ba;		//	SDRAM的L-Bank地址线
output[11:0] sdram_addr;	//  SDRAM地址总线
inout[15:0] sdram_data;		// SDRAM数据总线
	//视频输入接口
input vpclk;		//视频时钟
input vvsync;	//视频场同步信号
input vhref;		//视频行同步信号
input[7:0] vdb;	//视频数据总线
output vxclk;	//视频驱动时钟
output vscl;	//串行配置IIC时钟信号
inout vsda;	//串行配置IIC数据信号

//---------------------------------------------
	//LCD与FIFO的接口
wire[15:0] rdfifo_rddb;		//FIFO读出数据总线
wire rdfifo_rdreq;	//FIFO读请求信号
wire rdfifo_clr;		//FIFO复位信号，高电平有效
	// SDRAM的封装接口
wire sdram_wr_req;			//系统写SDRAM请求信号
wire sdram_rd_req;			//系统读SDRAM请求信号
wire sdram_wr_ack;			//系统写SDRAM响应信号,作为wrFIFO的输出有效信号
wire sdram_rd_ack;			//系统读SDRAM响应信号,作为rdFIFO的输写有效信号	
wire[8:0] sdwr_byte = 9'd160;	//突发写SDRAM字节数（1-256个）
wire[8:0] sdrd_byte = 9'd160;	//突发读SDRAM字节数（1-256个）
wire[21:0] sys_wraddr;		//写SDRAM时地址暂存器，(bit21-20)L-Bank地址:(bit19-8)为行地址，(bit7-0)为列地址 
wire[21:0] sys_rdaddr;		//读SDRAM时地址暂存器，(bit21-20)L-Bank地址:(bit19-8)为行地址，(bit7-0)为列地址 
wire[15:0] sys_data_in;		//写SDRAM时数据暂存器
wire[15:0] sys_data_out;	//sdram数据读出缓存FIFO输入数据总线
	//wrFIFO输入控制接口
wire[15:0] wrf_din;		//sdram数据写入缓存FIFO输入数据总线
//wire[21:0] wrf_ain;		//sdram数据写入缓存FIFO输入地址总线
wire wrf_wrreq;			//sdram数据写入缓存FIFO数据输入请求，高有效
	//系统控制相关信号接口
wire clk_25m;		//PLL输出25MHz时钟
wire clk_50m;	//PLL输出50MHz时钟
wire clk_100m;	//PLL输出100MHz时钟
wire sys_rst_n;	//系统复位信号，低有效

assign vxclk = clk_25m;		//25MHz输出给OV7670

//------------------------------------------------
//例化系统复位信号和PLL控制模块
sys_ctrl		uut_sysctrl(
					.clk(clk),
					.rst_n(rst_n),
					.sys_rst_n(sys_rst_n),
					.clk_25m(clk_25m),
					.clk_50m(clk_50m),
					.clk_100m(clk_100m),
					.sdram_clk(sdram_clk)
					);

//------------------------------------------------
//视频采集控制模块	
video_input		uut_videoinput(
					.clk(clk_25m),
					.clk_100m(clk_100m),
					.rst_n(sys_rst_n),
					.vpclk(vpclk),
					.vvsync(vvsync),
					.vhref(vhref),
					.vdb(vdb),
					.vscl(vscl),
					.vsda(vsda),
					.wrf_din(wrf_din),
					.wrf_wrreq(wrf_wrreq)
					);		

//---------------------------------------------
	//LCD驱动模块
lcd_driver	uut_lcd_driver(	
				.clk(clk_25m),	//25MHz
				.rst_n(sys_rst_n),
				.lcd_en(lcd_en),
				.lcd_clk(lcd_clk),
				.lcd_hsy(lcd_hsy),
				.lcd_vsy(lcd_vsy),
				.lcd_db_r(lcd_db_r),
				.lcd_db_g(lcd_db_g),
				.lcd_db_b(lcd_db_b),
				.rdfifo_rddb(rdfifo_rddb),//
				.rdfifo_rdreq(rdfifo_rdreq),//
				.rdfifo_clr(rdfifo_clr)//
			);

//------------------------------------------------
	//例化SDRAM封装控制模块
sdram_top		uut_sdramtop(				// SDRAM
							.clk(clk_100m),
							.rst_n(sys_rst_n),
							.sdram_wr_req(sdram_wr_req),//
							.sdram_rd_req(sdram_rd_req),//
							.sdram_wr_ack(sdram_wr_ack),//
							.sdram_rd_ack(sdram_rd_ack),//	
							.sys_wraddr(sys_wraddr),//
							.sys_rdaddr(sys_rdaddr),//
							.sys_data_in(sys_data_in),//
							.sys_data_out(sys_data_out),//
							.sdwr_byte(sdwr_byte),//
							.sdrd_byte(sdrd_byte),//	
							.sdram_cke(sdram_cke),
							.sdram_cs_n(sdram_cs_n),
							.sdram_ras_n(sdram_ras_n),
							.sdram_cas_n(sdram_cas_n),
							.sdram_we_n(sdram_we_n),
							.sdram_ba(sdram_ba),
							.sdram_addr(sdram_addr),
							.sdram_data(sdram_data),
							.sdram_udqm(),
							.sdram_ldqm()
					);
	

//------------------------------------------------
	//读写SDRAM数据缓存FIFO模块例化	
sdfifo_ctrl			uut_sdffifoctrl(
						.clk_25m(clk_25m),
						.clk_100m(clk_100m),
						.rst_n(sys_rst_n),
						.wrf_clr(vvsync),						
						.wrf_din(wrf_din),
						.wrf_wrreq(wrf_wrreq),
						.sdram_wr_ack(sdram_wr_ack),//
						.sys_wraddr(sys_wraddr),//
						.sys_rdaddr(sys_rdaddr),//
						.sys_data_in(sys_data_in),//
						.sdram_wr_req(sdram_wr_req),//
						.sys_data_out(sys_data_out),//
						.sdram_rd_ack(sdram_rd_ack),//
						.sdram_rd_req(sdram_rd_req),//
						.rdfifo_rdreq(rdfifo_rdreq),//						
						.rdfifo_clr(rdfifo_clr),//
						.rdfifo_rddb(rdfifo_rddb)//
					);

endmodule
