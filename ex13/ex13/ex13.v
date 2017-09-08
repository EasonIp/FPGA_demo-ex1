
module ex13(
			clk,rst_n,rom_data
		);

input clk;	//ʱ���źţ�25MHz����
input rst_n;	//��λ�źţ��͵�ƽ��Ч	
output[7:0]	rom_data;	//ROM�������

//////////////////////////////////////////////
reg[4:0] rom_addr;	//ROM�����ַ
wire[7:0] rom_data;	//ROM�������

reg[9:0] cnt;	//�����Ĵ�����0-1011��һ�������൱��1024*40ns=40.96us

always @(posedge clk or negedge rst_n)
	if(!rst_n) cnt <= 10'd0;
	else cnt <= cnt+1'b1;

	//����ROM��ַ��ȡ���ݲ���
always @(posedge clk or negedge rst_n)
	if(!rst_n) rom_addr <= 5'd0;
	else if(cnt == 10'd0) rom_addr <= 5'd0;
	else if((cnt >= 10'd100) && (cnt < 10'd108)) rom_addr <= rom_addr+1'b1;	//��������8����ַ
	else if((cnt >= 10'd110) && (cnt < 10'd124)) rom_addr <= rom_addr+1'b1;	//��������16����ַ
	else if((cnt >= 10'd130) && (cnt < 10'd138)) rom_addr <= rom_addr+1'b1;	//��������8����ַ
	else if(cnt == 200) rom_addr <= 5'd10;	//��ȡ��ַ10����
	else if(cnt == 210) rom_addr <= 5'd20;	//��ȡ��ַ20����
	else ;

//////////////////////////////////////////////
//����ROM	
ex_rom	ex_rom_inst (
	.address ( rom_addr ),	//��ַ
	.clock ( clk ),		//ͬ��ʱ��
	.q ( rom_data )		//�������
	);

endmodule
