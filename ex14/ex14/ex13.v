
module ex13(
			clk,rst_n,ram_rddb
		);

input clk;	
input rst_n;		
output[7:0]	ram_rddb;														

//////////////////////////////////////////////
reg[4:0] ram_addr;															
reg[7:0] ram_wrdb;															
reg ram_wren;																

reg[9:0] cnt;																

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else cnt <= cnt+1'b1;
	
always @(posedge clk or negedge rst_n)										
	if(!rst_n) begin
		ram_wren <= 1'b0;
		ram_addr <= 5'd0;
		ram_wrdb <= 8'd0;
	end
	else if((cnt > 10'd0) && (cnt < 10'd33)) begin							
		ram_wren <= 1'b1;
		ram_addr <= ram_addr+1'b1;
		ram_wrdb <= cnt[7:0]+8'h55;	
	end
	else if((cnt > 10'd100) && (cnt < 10'd133)) begin						
		ram_wren <= 1'b0;
		ram_addr <= ram_addr+1'b1;
		ram_wrdb <= 8'd0;	
	end
	else begin
		ram_wren <= 1'b0;
		ram_addr <= 5'd0;
		ram_wrdb <= 8'd0;	
	end

//////////////////////////////////////////////	
ex_ram	ex_ram_inst (														
	.aclr ( !rst_n ),	
	.address ( ram_addr ),	
	.clock ( clk ),		
	.data ( ram_wrdb ),		
	.wren ( ram_wren ),		
	.q ( ram_rddb )	
	);	

endmodule

