module ex17(	
				clk,rst_n,
				lcd_en,lcd_clk,lcd_hsy,lcd_vsy,lcd_db_r,lcd_db_g,lcd_db_b
			);
input clk;		//25MHz
input rst_n;	//�͵�ƽ��λ
	// FPGA��LCD�ӿ��ź�
output lcd_en;	//����ʹ���źţ�����Ч
output lcd_clk;	//ʱ���ź�	
output lcd_hsy;	//��ͬ���ź�
output lcd_vsy;	//��ͬ���ź�
output[4:0] lcd_db_r;
output[5:0] lcd_db_g;
output[4:0] lcd_db_b;

//---------------------------------------------
	//LCD���ַ��洢RAM�Ľӿ�
wire[31:0] ram_db;	//RAM��������
wire[5:0] ram_ab;	//RAM��ַ����

//---------------------------------------------
	//RAM��������RAM�д洢һ��32*64��ASCII�ַ�����ģ
myram	myram_inst (
	.address ( ram_ab ),
	.clock ( clk ),
	.data ( 32'd0 ),
	.wren ( 1'b0 ),
	.q ( ram_db )
	);

//---------------------------------------------
	//LCD��ʾ����ģ��
lcd_driver	uut_lcd_driver(	
				.clk(clk),
				.rst_n(rst_n),
				.lcd_en(lcd_en),
				.lcd_clk(lcd_clk),
				.lcd_hsy(lcd_hsy),
				.lcd_vsy(lcd_vsy),
				.lcd_db_r(lcd_db_r),
				.lcd_db_g(lcd_db_g),
				.lcd_db_b(lcd_db_b),
				.ram_db(ram_db),
				.ram_ab(ram_ab)
			);
		
endmodule


