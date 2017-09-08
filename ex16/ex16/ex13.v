module ex13(
			clk,rst_n,
			ram_dout
		);

input clk;	//ʱ���źţ�25MHz����
input rst_n;	//��λ�źţ��͵�ƽ��Ч	
output[7:0]	ram_dout;	//��λ�Ĵ����������

//////////////////////////////////////////////
reg[24:0] cnt;	//�����Ĵ�����һ������1s
reg[5:0] rom_cnt;	//0-31����
wire[4:0] rom_addr;	//ROM��ַ
wire[7:0] rom_dout;	//ROM�������ݣ���FIFOд������

	//1s����
always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else if(cnt >= 25'd25_000_000) cnt <= 10'd0;
	else cnt <= cnt+1'b1;

	//����32��ROM����ַ
always @(posedge clk or negedge rst_n)	
	if(!rst_n) rom_cnt <= 6'd0;
	else if((cnt == 25'd20) && (rom_cnt <= 6'd31)) rom_cnt <= rom_cnt+1'b1;
	else ;

assign rom_addr = rom_cnt[4:0];

//////////////////////////////////////////////
//rom����
ex_rom	ex_rom_inst (
	.address ( rom_addr ),
	.clock ( clk ),
	.q ( rom_dout )
	);

//////////////////////////////////////////////	
reg fifo_wrreq;			//fifoд�����ź�
wire[4:0] fifo_rduse;	//fifo�洢���ɶ����ݸ���
reg[3:0] fifo_cnt;		//8��fifo�������ݼ�����
reg fifo_rdreq;			//fifo�������ź�
wire[7:0] fifo_dout;			//fifo�������ݣ�RAM����������
	
	//����FIFO��32��д����������ź�
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_wrreq <= 1'b0;
	else if((cnt == 25'd10) && (rom_cnt <= 6'd31)) fifo_wrreq <= 1'b1;
	else fifo_wrreq <= 1'b0;	

	//fifo_cnt�����߼�
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_cnt <= 4'd0;
	else if(fifo_cnt != 4'd0) fifo_cnt <= fifo_cnt+1'b1;
	else if(fifo_rduse >= 5'd8) fifo_cnt <= 4'd1;	//fifo�ɶ�������>=8��������fifo_cnt��ʼ����
	else ;

	//fifo�������źŲ���
always @(posedge clk or negedge rst_n)	
	if(!rst_n) fifo_rdreq <= 1'b0;
	else if((fifo_cnt > 4'd0) && (fifo_cnt < 4'd9)) fifo_rdreq <= 1'b1;
	else fifo_rdreq <= 1'b0;
	
//////////////////////////////////////////////
//fifo����
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
reg[4:0] ram_addr;		//RAM��ַ
reg ram_wren;			//RAMд��ʹ���ź�

	//ramд��ʹ�ܺ͵�ַ�����߼�
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
//ram����	
ex_ram	ex_ram_inst (
	.aclr ( !rst_n ),
	.address ( ram_addr ),
	.clock ( clk ),
	.data ( fifo_dout ),
	.wren ( ram_wren ),
	.q ( ram_dout )
	);
	
endmodule
