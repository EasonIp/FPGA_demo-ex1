module vga_ctrl(
		clk_25m,clk_50m,rst_n,
		vga_r,vga_g,vga_b,
		vga_hsy,vga_vsy,vga_clk,
		adv7123_blank_n,adv7123_sync_n
	);

input clk_25m;
input clk_50m;
input rst_n;
//-----------------------------------------------------------				
output[4:0] vga_r;
output[5:0] vga_g;
output[4:0] vga_b;
output vga_clk;
output adv7123_blank_n;
output adv7123_sync_n;
//-----------------------------------------------------------				
output reg vga_hsy,vga_vsy;

//-----------------------------------------------------------				
wire clk;
assign vga_clk = clk;

//-----------------------------------------------------------				
//`define VGA_640_480
`define VGA_800_600

//-----------------------------------------------------------				
`ifdef VGA_640_480															
	assign clk = clk_25m;
		
	parameter VGA_HTT = 12'd800-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd96;		//Hor Sync  Time
	parameter VGA_HBP = 12'd48;//+12'd16;		//Hor Back Porch
	parameter VGA_HVT = 12'd640;	//Hor Valid Time
	parameter VGA_HFP = 12'd16;		//Hor Front Porch

	parameter VGA_VTT = 12'd525-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd2;		//Ver Sync Time
	parameter VGA_VBP = 12'd33;//-12'd4;		//Ver Back Porch
	parameter VGA_VVT = 12'd480;	//Ver Valid Time
	parameter VGA_VFP = 12'd10;		//Ver Front Porch
`endif

`ifdef VGA_800_600															
	//VGA Timing 800*600 & 50MHz & 72Hz
	assign clk = clk_50m;

	parameter VGA_HTT = 12'd1040-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd120;		//Hor Sync  Time
	parameter VGA_HBP = 12'd64;		//Hor Back Porch
	parameter VGA_HVT = 12'd800;	//Hor Valid Time
	parameter VGA_HFP = 12'd56;		//Hor Front Porch

	parameter VGA_VTT = 12'd666-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd6;		//Ver Sync Time
	parameter VGA_VBP = 12'd23;		//Ver Back Porch
	parameter VGA_VVT = 12'd600;	//Ver Valid Time
	parameter VGA_VFP = 12'd37;		//Ver Front Porch
`endif

//-----------------------------------------------------------				
reg[11:0] xcnt;
reg[11:0] ycnt;
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) xcnt <= 12'd0;
	else if(xcnt >= VGA_HTT) xcnt <= 12'd0;
	else xcnt <= xcnt+1'b1;

always @(posedge clk or negedge rst_n)
	if(!rst_n) ycnt <= 12'd0;
	else if(xcnt == VGA_HTT) begin
		if(ycnt >= VGA_VTT) ycnt <= 12'd0;
		else ycnt <= ycnt+1'b1;
	end
	else ;
		
//-----------------------------------------------------------				
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_hsy <= 1'b0;
	else if(xcnt < VGA_HST) vga_hsy <= 1'b1;
	else vga_hsy <= 1'b0;
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_vsy <= 1'b0;
	else if(ycnt < VGA_VST) vga_vsy <= 1'b1;
	else vga_vsy <= 1'b0;	
	
//-----------------------------------------------------------				
reg vga_valid;

always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_valid <= 1'b0;
	else if((xcnt >= (VGA_HST+VGA_HBP)) && (xcnt < (VGA_HST+VGA_HBP+VGA_HVT))
			&& (ycnt >= (VGA_VST+VGA_VBP)) && (ycnt < (VGA_VST+VGA_VBP+VGA_VVT)))
		 vga_valid <= 1'b1;
	else vga_valid <= 1'b0;

assign adv7123_blank_n = vga_valid;
assign adv7123_sync_n = 1'b0;
	
//-----------------------------------------------------------				
reg[4:0] vga_rdb;
reg[5:0] vga_gdb;
reg[4:0] vga_bdb;

always @(posedge clk or negedge rst_n)
	if(!rst_n) begin
		vga_rdb <= 5'd0;
		vga_gdb <= 6'd0;
		vga_bdb <= 5'd0;
	end
	else if(xcnt == (VGA_HST+VGA_HBP)) begin								
		vga_rdb <= 5'h0;
		vga_gdb <= 6'h3f;
		vga_bdb <= 5'd0;		
	end
	else if(xcnt == (VGA_HST+VGA_HBP+VGA_HVT-1'b1)) begin					
		vga_rdb <= 5'h0;
		vga_gdb <= 6'h3f;
		vga_bdb <= 5'd0;		
	end
	else if(ycnt == (VGA_VST+VGA_VBP)) begin								
		vga_rdb <= 5'h0;
		vga_gdb <= 6'h3f;
		vga_bdb <= 5'd0;		
	end
	else if(ycnt == (VGA_VST+VGA_VBP+VGA_VVT-1'b1)) begin					
		vga_rdb <= 5'h0;
		vga_gdb <= 6'h3f;
		vga_bdb <= 5'd0;		
	end
	else begin																
		vga_rdb <= 5'h1f;
		vga_gdb <= 6'd0;
		vga_bdb <= 5'd0;	
	end

//-----------------------------------------------------------				
assign vga_r = vga_valid ? vga_rdb:5'd0;
assign vga_g = vga_valid ? vga_gdb:6'd0;	
assign vga_b = vga_valid ? vga_bdb:5'd0;	
	
endmodule
