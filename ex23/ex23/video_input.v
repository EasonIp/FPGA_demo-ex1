
module video_input(
				clk,clk_100m,rst_n,
				vpclk,vvsync,vhref,vdb,vscl,vsda,
				wrf_din,wrf_wrreq
			);

input clk;			//系统时钟，25MHz
input clk_100m;	//PLL输出100MHz时钟
input rst_n;		//复位信号，低电平有效
	//视频输入接口
input vpclk;		//视频时钟
input vvsync;	//视频场同步信号
input vhref;		//视频行同步信号
input[7:0] vdb;	//视频数据总线
output vscl;	//串行配置IIC时钟信号
inout vsda;	//串行配置IIC数据信号
	//wrFIFO输入控制接口
output[15:0] wrf_din;		//sdram数据写入缓存FIFO输入数据总线
output wrf_wrreq;			//sdram数据写入缓存FIFO数据输入请求，高有效

//------------------------------------------------
	//视频IIC配置端口
wire tiic_en;		//需要通过IIC接口配置MAX9526使能信号，高电平有效
wire[7:0] tiic_ab;	//需要通过IIC接口配置MAX9526地址
wire[7:0] tiic_db;	//需要通过IIC接口配置MAX9526数据	


//------------------------------------------------
//IIC时序产生模块
iic_ctrl	uut_iicctrl(
				.clk(clk),
				.rst_n(rst_n),
				.tiic_en(tiic_en),
				.tiic_ab(tiic_ab),
				.tiic_db(tiic_db),
				.scl(vscl),
				.sda(vsda)
			);

//------------------------------------------------
//IIC寄存器
iic_gene	uut_iicgene(
				.clk(clk),
				.rst_n(rst_n),
				.tiic_en(tiic_en),
				.tiic_ab(tiic_ab),
				.tiic_db(tiic_db)
			);

//------------------------------------------------
//视频输入缓存控制
video_ctrl	uut_videoctrl(
				.clk(clk_100m),
				.rst_n(rst_n),
				.vpclk(vpclk),
				.vvsync(vvsync),
				.vhref(vhref),
				.vdb(vdb),
				.wrf_din(wrf_din),
				.wrf_wrreq(wrf_wrreq)
			);

endmodule

