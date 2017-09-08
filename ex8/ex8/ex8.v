
module ex8(
		clk,rst_n,
		vga_r,vga_g,vga_b,
		vga_hsy,vga_vsy,vga_clk,
		adv7123_blank_n,adv7123_sync_n
	);

input clk;
input rst_n;
output[4:0] vga_r;
output[5:0] vga_g;
output[4:0] vga_b;

output vga_hsy,vga_vsy;
output vga_clk;
output adv7123_blank_n;
output adv7123_sync_n;

//-----------------------------------------------------------
	//PLL模块例化
wire sys_rst_n;	//系统复位信号，低有效
wire clk_25m;		//PLL输出25MHz时钟
wire clk_50m;		//PLL输出50MHz时钟

sys_ctrl	uut_sys_ctrl(
				.clk(clk),
				.rst_n(rst_n),
				.sys_rst_n(sys_rst_n),
				.clk_25m(clk_25m),
				.clk_50m(clk_50m)
			);
	
	
//-----------------------------------------------------------
	//vga_ctrl模块例化
vga_ctrl	uut_vga_ctrl(
		.clk_25m(clk_25m),
		.clk_50m(clk_50m),
		.rst_n(sys_rst_n),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_hsy(vga_hsy),
		.vga_vsy(vga_vsy),
		.vga_clk(vga_clk),
		.adv7123_blank_n(adv7123_blank_n),
		.adv7123_sync_n(adv7123_sync_n)
	);

	
endmodule

