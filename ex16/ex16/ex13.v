module ex13(
			clk,rst_n,
			ram_dout
		);

input clk;	//时钟信号，25MHz输入
input rst_n;	//复位信号，低电平有效	
output[7:0]	ram_dout;	//移位寄存器输出数据

//////////////////////////////////////////////
reg[24:0] cnt;	//计数寄存器，一个周期1s
reg[5:0] rom_cnt;	//0-31计数
wire[4:0] rom_addr;	//ROM地址
wire[7:0] rom_dout;	//ROM读出数据，即FIFO写入数据

	//1s计数
always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else if(cnt >= 25'd25_000_000) cnt <= 10'd0;
	else cnt <= cnt+1'b1;

	//产生32个ROM读地址
always @(posedge clk or negedge rst_n)	
	if(!rst_n) rom_cnt <= 6'd0;
	else if((cnt == 25'd20) && (rom_cnt <= 6'd31)) rom_cnt <= rom_cnt+1'b1;
	else ;

assign rom_addr = rom_cnt[4:0];

//////////////////////////////////////////////
//rom例化
ex_rom	ex_rom_inst (
	.address ( rom_addr ),
	.clock ( clk ),
	.q ( rom_dout )
	);

//////////////////////////////////////////////	
reg fifo_wrreq;			//fifo写请求信号
wire[4:0] fifo_rduse;	//fifo存储器可读数据个数
reg[3:0] fifo_cnt;		//8个fifo读出数据计数器
reg fifo_rdreq;			//fifo读请求信号
wire[7:0] fifo_dout;			//fifo读出数据，RAM的输入数据
	
	//产生FIFO的32次写入操作请求信号
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_wrreq <= 1'b0;
	else if((cnt == 25'd10) && (rom_cnt <= 6'd31)) fifo_wrreq <= 1'b1;
	else fifo_wrreq <= 1'b0;	

	//fifo_cnt计数逻辑
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_cnt <= 4'd0;
	else if(fifo_cnt != 4'd0) fifo_cnt <= fifo_cnt+1'b1;
	else if(fifo_rduse >= 5'd8) fifo_cnt <= 4'd1;	//fifo可读出数据>=8，计数器fifo_cnt开始计数
	else ;

	//fifo读请求信号产生
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_rdreq <= 1'b0;
	else if((fifo_cnt > 4'd0) && (fifo_cnt < 4'd9)) fifo_rdreq <= 1'b1;
	else fifo_rdreq <= 1'b0;
	
//////////////////////////////////////////////
//fifo例化
ex_fifo	ex_fifo_inst (
	.aclr ( !rst_n ),
	.data ( rom_dout ),
	.rdclk ( clk ),
	.rdreq ( fifo_rdreq ),
	.wrclk ( clk ),
	.wrreq ( fifo_wrreq ),
	.q ( fifo_dout ),
	.rdusedw ( fifo_rduse )
	);
	
//////////////////////////////////////////////	
reg[4:0] ram_addr;		//RAM地址
reg ram_wren;			//RAM写入使能信号

	//ram写入使能和地址产生逻辑
always @(posedge clk or negedge rst_n)	
	if(!rst_n) begin
		ram_addr <= 5'h1f;
		ram_wren <= 1'b0;
	end
	else if(fifo_rdreq) begin
		ram_wren <= 1'b1;
		ram_addr <= ram_addr+1'b1;
	end
	else ram_wren <= 1'b0;


//////////////////////////////////////////////
//ram例化	
ex_ram	ex_ram_inst (
	.aclr ( !rst_n ),
	.address ( ram_addr ),
	.clock ( clk ),
	.data ( fifo_dout ),
	.wren ( ram_wren ),
	.q ( ram_dout )
	);
	
endmodule
