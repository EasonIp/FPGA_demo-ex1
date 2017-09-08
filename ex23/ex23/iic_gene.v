
module iic_gene(
				clk,rst_n,
				tiic_en,tiic_ab,tiic_db
			);

input clk;		// 50MHz主时钟
input rst_n;		//低电平复位信号

output tiic_en;		//需要通过IIC接口配置MAX9526使能信号，高电平有效
output reg[7:0] tiic_ab;	//需要通过IIC接口配置MAX9526地址
output reg[7:0] tiic_db;	//需要通过IIC接口配置MAX9526数据	

//-------------------------------------------------------
//初始化参数ROM例化
wire[6:0] romab;
wire[15:0] romdb;

iic_initrom 		uut_iicinitrom(
					.address(romab),
					.clock(clk),
					.q(romdb)
				);
	
//-------------------------------------------------------
//上电延时20ms
reg[19:0] dcnt;	//延时计数器
reg[6:0] mcnt;	//mcnt个20ms计数周期

always @(posedge clk or negedge rst_n)
	if(!rst_n) dcnt <= 20'd0;
	else if(mcnt < 7'd127) begin
		if(dcnt < 20'd30000) dcnt <= dcnt+1'b1;
		else dcnt <= 20'd0;
	end
		
wire wren = (dcnt == 20'd1000);	
	
//-------------------------------------------------------
//20ms计数周期控制

always @(posedge clk or negedge rst_n)
	if(!rst_n) mcnt <= 7'd0;
	else if(dcnt == 20'd2000) mcnt <= mcnt+1'b1;
	
//-------------------------------------------------------
//初始化寄存器设置
	//12H地址设置为14H，bit4=1--QVGA模式，bit2=1,bit0=0--RGB模式
parameter	RIDLE = 3'd0;
parameter	RSET1 = 3'd1;
parameter	ROVER = 3'd2;
reg[2:0] rstate;	
	
always @(posedge clk or negedge rst_n)	
	if(!rst_n) begin
		rstate <= RIDLE;
		tiic_ab <= 8'd0;
		tiic_db <= 8'd0;
	end
	else begin
		case(rstate)
			RIDLE:	if((mcnt > 7'd6) && wren) begin
						rstate <= RSET1;
						tiic_ab <= romdb[15:8];
						tiic_db <= romdb[7:0];
					end
					else if(mcnt == 7'd126) rstate <= ROVER;
					else rstate <= RIDLE;
			RSET1:	rstate <= RIDLE;
			ROVER: 	rstate <= ROVER;
			default: rstate <= RIDLE;
		endcase
	end
	
assign tiic_en = (rstate == RSET1);		//IIC写入请求信号
assign romab = mcnt-7'd7;


endmodule
