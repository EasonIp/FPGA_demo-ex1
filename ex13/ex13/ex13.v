
module ex13(
			clk,rst_n,rom_data
		);

input clk;	//时钟信号，25MHz输入
input rst_n;	//复位信号，低电平有效	
output[7:0]	rom_data;	//ROM输出数据

//////////////////////////////////////////////
reg[4:0] rom_addr;	//ROM输入地址
wire[7:0] rom_data;	//ROM输出数据

reg[9:0] cnt;	//计数寄存器，0-1011，一个周期相当于1024*40ns=40.96us

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else cnt <= cnt+1'b1;

	//产生ROM地址读取数据测试
always @(posedge clk or negedge rst_n)
	if(!rst_n) rom_addr <= 5'd0;
	else if(cnt == 10'd0) rom_addr <= 5'd0;
	else if((cnt >= 10'd100) && (cnt < 10'd108)) rom_addr <= rom_addr+1'b1;	//连续递增8个地址
	else if((cnt >= 10'd110) && (cnt < 10'd124)) rom_addr <= rom_addr+1'b1;	//连续递增16个地址
	else if((cnt >= 10'd130) && (cnt < 10'd138)) rom_addr <= rom_addr+1'b1;	//连续递增8个地址
	else if(cnt == 200) rom_addr <= 5'd10;	//读取地址10数据
	else if(cnt == 210) rom_addr <= 5'd20;	//读取地址20数据
	else ;

//////////////////////////////////////////////
//例化ROM	
ex_rom	ex_rom_inst (
	.address ( rom_addr ),	//地址
	.clock ( clk ),		//同步时钟
	.q ( rom_data )		//输出数据
	);

endmodule
