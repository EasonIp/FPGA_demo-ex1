
module video_ctrl(
				clk,rst_n,
				vpclk,vvsync,vhref,vdb,
				wrf_din,wrf_wrreq
			);

input clk;			//系统时钟，25MHz
input rst_n;		//复位信号，低电平有效
	//视频输入接口
input vpclk;		//视频时钟
input vvsync;	//视频场同步信号
input vhref;		//视频行同步信号
input[7:0] vdb;	//视频数据总线
	//wrFIFO输入控制接口
output[15:0] wrf_din;		//sdram数据写入缓存FIFO输入数据总线
output wrf_wrreq;			//sdram数据写入缓存FIFO数据输入请求，高有效

//-------------------------------------------------------
reg wrf_clr_r;	//wrf_clr_r同步锁存一拍

always @(posedge clk or negedge rst_n)
	if(!rst_n) wrf_clr_r <= 1'b0;
	else wrf_clr_r <= vvsync;

//-------------------------------------------------------
//数据缓存FIFO例化
wire[7:0] vf_rduse;	//数据有效个数

wire vf_rdreq = ~(dcnt == 8'd0);	//读FIFO请求

video_fifo 	uut_videofifo(
				.aclr(wrf_clr_r),
				.data(vdb),
				.rdclk(clk),
				.rdreq(vf_rdreq),
				.wrclk(vpclk),
				.wrreq(vhref),
				.q({wrf_din[7:0],wrf_din[15:8]}),	//input first--LSB,input second--MSB
				.rdusedw(vf_rduse)
				);	

//-------------------------------------------------------
//写入请求信号产生
reg[7:0] dcnt;

always @(posedge clk or negedge rst_n)
	if(!rst_n) dcnt <= 8'd0;
	else if(vf_rduse > 8'd158) dcnt <= dcnt+1'b1;
	else if((dcnt != 8'd0) && (dcnt < 8'd160)) dcnt <= dcnt+1'b1;
	else dcnt <= 8'd0;

reg wrf_wrreqr;

always @(posedge clk or negedge rst_n)
	if(!rst_n) wrf_wrreqr <= 1'b0;
	else wrf_wrreqr <= vf_rdreq;

assign wrf_wrreq = wrf_wrreqr;	//sdram数据写入缓存FIFO数据输入请求，高有效

endmodule

