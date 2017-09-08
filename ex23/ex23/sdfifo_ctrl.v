
module sdfifo_ctrl(
				clk_25m,clk_100m,rst_n,
				wrf_clr,wrf_din,wrf_wrreq,
				sdram_wr_ack,sys_wraddr,sys_rdaddr,sys_data_in,sdram_wr_req,
				sys_data_out,sdram_rd_ack,sdram_rd_req,
				rdfifo_rdreq,rdfifo_clr,rdfifo_rddb
			);

input clk_25m;	//PLL输出25MHz时钟
input clk_100m;	//PLL输出100MHz时钟
input rst_n;	//系统复位信号，低有效
	//wrFIFO控制
input wrf_clr;			//sdram数据写入缓存FIFO复位信号，高电平有效
input wrf_wrreq;			//sdram数据写入缓存FIFO数据输入请求，高有效
input[15:0] wrf_din;		//sdram数据写入缓存FIFO输入数据总线
input sdram_wr_ack;			//系统写SDRAM响应信号,作为wrFIFO的输出有效信号
output sdram_wr_req;		//系统写SDRAM请求信号
output[15:0] sys_data_in;	//sdram数据写入缓存FIFO输出数据总线，即写SDRAM时数据暂存器
output[21:0] sys_wraddr;	//写SDRAM时地址暂存器，(bit21-20)L-Bank地址:(bit19-8)为行地址，(bit7-0)为列地址 
	//rdFIFO写入控制
input sdram_rd_ack;			//系统读SDRAM响应信号,作为rdFIFO的输写有效信号
input[15:0] sys_data_out;	//sdram数据读出缓存FIFO输入数据总线
output sdram_rd_req;		//系统读SDRAM请求信号
output[21:0] sys_rdaddr;	//读SDRAM时地址暂存器，(bit21-20)L-Bank地址:(bit19-8)为行地址，(bit7-0)为列地址 
	//rdFIFO读出控制
input rdfifo_rdreq;			//sdram数据读出缓存FIFO数据输出请求，高有效
input rdfifo_clr;		//高有效，用于使能SDRAM读数据单元进行寻址或地址清零
output[15:0] rdfifo_rddb;	//VGA显示数据

//------------------------------------------------
//sdram读写响应完成标致捕获
reg sdwrackr1,sdwrackr2;	//sdram_wr_ack寄存器
reg sdrdackr1,sdrdackr2;	//sdram_rd_ack寄存器

	//锁存两拍sdram_wr_ack，用于下降沿捕获
always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) begin
			sdwrackr1 <= 1'b0;
			sdwrackr2 <= 1'b0;
		end
	else begin
			sdwrackr1 <= sdram_wr_ack;
			sdwrackr2 <= sdwrackr1;			
		end
		
wire neg_sdwrack = ~sdwrackr1 & sdwrackr2;	//sdram_wr_ack下降沿标志位，高有效一个时钟周期

	//锁存两拍sdram_rd_ack，用于下降沿捕获
always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) begin
			sdrdackr1 <= 1'b0;
			sdrdackr2 <= 1'b0;
		end
	else begin
			sdrdackr1 <= sdram_rd_ack;
			sdrdackr2 <= sdrdackr1;			
		end
		
wire neg_sdrdack = ~sdrdackr1 & sdrdackr2;	//sdram_rd_ack下降沿标志位，高有效一个时钟周期

//------------------------------------------------
reg rdfifo_clrr;		//将50M时钟域的rdfifo_clr打一拍以同步到100M的rdfifo_clrr

always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) rdfifo_clrr <= 1'b0;
	else rdfifo_clrr <= rdfifo_clr;
	
//------------------------------------------------
reg wrf_clr_r;

always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) wrf_clr_r <= 1'b1;
	else wrf_clr_r <= wrf_clr;
	
//------------------------------------------------
//读写sdram请求信号产生
wire[8:0] wrf_use;		//sdram数据写入缓存FIFO已用存储空间数量
wire[8:0] rdf_use;		//sdram数据读出缓存FIFO已用存储空间数量	

assign sdram_wr_req = (wrf_use > 9'd158);	//FIFO（160个16bit数据）即发出写SDRAM请求信号
assign sdram_rd_req = (rdf_use < 9'd350) & ~rdfifo_clrr;	//VGA显示有效且FIFO不满350个数据即发出读SDRAM请求信号

//------------------------------------------------
//sdram写地址产生逻辑
reg[13:0] sys_wrabr;	//SDRAM写数据页

	//sdram写地址产生
always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) sys_wrabr <= 14'd0;
	else if(wrf_clr_r) sys_wrabr <= 14'd0;	//从起始地址写数据
	else if(neg_sdwrack) sys_wrabr <= sys_wrabr+1'b1;	//一次写入完成后地址递增	

assign sys_wraddr = {sys_wrabr,8'd0};

//------------------------------------------------
//sdram读地址产生逻辑
reg[13:0] sys_rdabr;	//SDRAM读数据页

	//sdram读地址产生
always @(posedge clk_100m or negedge rst_n)
	if(!rst_n) sys_rdabr <= 14'd0;
	else if(rdfifo_clrr) sys_rdabr <= 14'd0;	//从起始地址读数据
	else if(neg_sdrdack) sys_rdabr <= sys_rdabr+1'b1;	//一次读出完成后地址递增	

assign sys_rdaddr = {sys_rdabr,8'd0};

//------------------------------------------------
//例化SDRAM写入数据缓存FIFO模块
wrfifo			uut_wrfifo(
					.aclr(wrf_clr_r),
					.data(wrf_din),
					.rdclk(clk_100m),
					.rdreq(sdram_wr_ack),
					.wrclk(clk_100m),
					.wrreq(wrf_wrreq),
					.q(sys_data_in),	//写入地址和数据输出
					.wrusedw(wrf_use)
					);						

//------------------------------------------------
//例化SDRAM读出数据缓存FIFO模块
rdfifo			uut_rdfifo(
					.aclr(rdfifo_clrr),
					.data(sys_data_out),
					.rdclk(clk_25m),
					.rdreq(rdfifo_rdreq),
					.wrclk(clk_100m),
					.wrreq(sdram_rd_ack),
					.q(rdfifo_rddb),
					.wrusedw(rdf_use)
					);


endmodule

