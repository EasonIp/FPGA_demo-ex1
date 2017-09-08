`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company		: 
// Engineer		: 特权 franchises3
// Create Date	: 2010.11.03
// Design Name	: 
// Module Name	: iic_ctrl
// Project Name	: 
// Target Device: 
// Tool versions: Quartus II 9.1 SP1
// Description	: 
//				
// Revision		: V1.0
// Additional Comments	:  
// 
////////////////////////////////////////////////////////////////////////////////
module iic_ctrl(
				clk,rst_n,
				tiic_en,tiic_ab,tiic_db,
				scl,sda
			);

input clk;			// 50MHz主时钟
input rst_n;		//低电平复位信号

input tiic_en;		//需要通过IIC接口配置MAX9526使能信号，高电平有效
input[7:0] tiic_ab;	//需要通过IIC接口配置MAX9526地址
input[7:0] tiic_db;	//需要通过IIC接口配置MAX9526数据	

output scl;	//串行配置IIC时钟信号
inout sda;	//串行配置IIC数据信号

//--------------------------------------------------------------------
reg[3:0] dcstate,dnstate;

//IIC读或写状态控制
parameter 	DIDLE	= 4'd0,	//idle
			DSTAR	= 4'd1,	//start transfer
			DSABW	= 4'd2,	//slave addr (write cmd)
			D1ACK	= 4'd3,	//ACK1
			DRABW	= 4'd4,	//device addr write
			D2ACK	= 4'd5,	//ACK2
/*wr data*/	DWRDB	= 4'd6,	//write data
			D3ACK	= 4'd7,	//ACK3
/*rd data*/	DRSTA	= 4'd8,	//restart transfer
			DSABR	= 4'd9,	//slave addr (read cmd)
			D4ACK	= 4'd10,//ACK4
			DRDDB	= 4'd11,//read data
			D5ACK	= 4'd12,//ACK5
			DSTOP	= 4'd13;//stop transfer
			
parameter	DEVICE_WRADD	= 8'h42,	//write device addr
			DEVICE_RDADD	= 8'h43;	//read device addr

//--------------------------------------------------------------------
//IIC时钟信号scl产生逻辑
reg[8:0] icnt;	//分频计数寄存器，50M/95K=512

always @(posedge clk or negedge rst_n)
	if(!rst_n) icnt <= 9'd0;
	else icnt <= icnt+1'b1;
	
wire scl = ~icnt[8] | (dcstate == DIDLE);	//0<=icnt<50时scl=1;50<=icnt<100时scl=0
wire scl_hs = (icnt == 9'd1);	//scl high start
wire scl_hc = (icnt == 9'd128);	//scl high center
wire scl_ls = (icnt == 9'd256);	//scl low start
wire scl_lc = (icnt == 9'd384);	//scl low center

//--------------------------------------------------------------------	
	//IIC状态机控制信号				
reg iicwr_req;	//IIC写请求信号，高电平有效
reg iicrd_req;	//IIC读请求信号，高电平有效		
//wire[7:0] cmd_addr = tiic_ab;
//reg[7:0] cmd_addr;	//IIC命令地址寄存器
//wire[7:0] iic_wrdb = tiic_db;
//reg[7:0] iic_wrdb;	//IIC写数据寄存器
reg[7:0] iic_rddb;	//IIC读数据寄存器

reg[2:0] bcnt;	//数据位寄存器,bit0-7	
reg sdar;	//sda输出数据寄存器
reg sdalink;	//sda方向控制寄存器,0--input,1--output
	
	//当前和下一状态切换
always @(posedge clk or negedge rst_n)
	if(!rst_n) dnstate <= DIDLE;
	else dnstate <= dcstate;

	//状态变迁
always @(dnstate or iicwr_req or iicrd_req or scl_hc or bcnt or scl_ls or scl_hs or scl_lc) begin
	case(dnstate) 
		DIDLE: 	if((iicwr_req || iicrd_req) && scl_hs) dcstate <= DSTAR;	//发出读或写IIC请求
				else dcstate <= DIDLE;
		DSTAR:	if(scl_ls) dcstate <= DSABW;
				else dcstate <= DSTAR;
		DSABW:	if(scl_lc && (bcnt == 3'd0)) dcstate <= D1ACK;
				else dcstate <= DSABW;	//slave addr (write cmd)
		D1ACK:	if(scl_ls && (bcnt == 3'd7)) dcstate <= DRABW;	
				else dcstate <= D1ACK;
		DRABW:	if(scl_lc && (bcnt == 3'd0)) dcstate <= D2ACK;
				else dcstate <= DRABW;	//device addr write
		D2ACK:	if(scl_ls && (bcnt == 3'd7) && iicwr_req) dcstate <= DWRDB;	//写数据
				else if(scl_ls && (bcnt == 3'd7) && iicrd_req) dcstate <= DRSTA;	//读数据
				else dcstate <= D2ACK;
/*wr_db*/DWRDB:	if(scl_lc && (bcnt == 3'd0)) dcstate <= D3ACK;
				else dcstate <= DWRDB;	//write data
		D3ACK:	if(scl_ls && (bcnt == 3'd7)) dcstate <= DSTOP;	
				else dcstate <= D3ACK;
/*rd_db*/DRSTA:	if(scl_ls) dcstate <= DSABR;
				else dcstate <= DRSTA;	
		DSABR:	if(scl_lc && (bcnt == 3'd0)) dcstate <= D4ACK;
				else dcstate <= DSABR;	//slave addr (read cmd)
		D4ACK:	if(scl_ls && (bcnt == 3'd7)) dcstate <= DRDDB;
				else dcstate <= D4ACK;
		DRDDB:	if(scl_hc && (bcnt == 3'd7)) dcstate <= D5ACK;
				else dcstate <= DRDDB;	//read data
		D5ACK:	if(scl_ls && (bcnt == 3'd6)) dcstate <= DSTOP;
				else dcstate <= D5ACK;
		DSTOP: 	if(scl_ls) dcstate <= DIDLE;
				else dcstate <= DSTOP;
		default: dcstate <= DIDLE;
		endcase
end
	
	//数据位寄存器控制
always @(posedge clk or negedge rst_n)
	if(!rst_n) bcnt <= 3'd0;
	else begin
		case(dnstate)
			DIDLE: bcnt <= 3'd7;
			DSABW,DRABW,DWRDB,DSABR: if(scl_hs) bcnt <= bcnt-1'b1;
			DRDDB: if(scl_hs) bcnt <= bcnt-1'b1;
			D1ACK,D2ACK,D3ACK: if(scl_lc) bcnt <= 3'd7;
			D4ACK: if(scl_ls) bcnt <= 3'd7;
			D5ACK: if(scl_lc) bcnt <= bcnt-1'b1;
			default: ;
			endcase
	end

	//IIC数据输入输出控制
always @(posedge clk or negedge rst_n)
	if(!rst_n) begin
			sdar <= 1'b1;
			sdalink <= 1'b1;	//output
			iic_rddb <= 8'd0;
		end
	else begin
		case(dnstate) 
			DIDLE: begin
					sdar <= 1'b1;
					sdalink <= 1'b1;	//output
				end
			DSTAR: begin
					if(scl_hc) sdar <= 1'b0;				
				end
			DSABW: begin
					if(scl_lc) sdar <= DEVICE_WRADD[bcnt];
				end
			D1ACK: begin
					if(scl_lc) begin
							sdar <= 1'b1;
							sdalink <= 1'b0;
						end
				end
			DRABW: begin
					if(scl_lc) begin 
							sdar <= tiic_ab[bcnt];
							sdalink <= 1'b1;
						end
				end	
			D2ACK: begin
					if(scl_lc) begin
							sdar <= 1'b1;
							sdalink <= 1'b0;
						end
				end
	/*wr_db*/DWRDB: begin
					if(scl_lc) begin
							sdar <= tiic_db[bcnt];
							sdalink <= 1'b1;
						end
				end
			D3ACK: begin
					if(scl_lc) begin
							sdar <= 1'b1;
							sdalink <= 1'b0;
						end
				end
	/*rd_db*/DRSTA:	begin
					if(scl_hc) sdar <= 1'b0;			
					else if(scl_lc) begin
							sdar <= 1'b1;	
							sdalink <= 1'b1;
						end
				end
			DSABR: begin
					if(scl_lc) sdar <= DEVICE_RDADD[bcnt];
				end 	
			D4ACK: begin
					if(scl_lc && (bcnt == 3'd7)) sdalink <= 1'b0;	//input
				end
			DRDDB: begin
					if(scl_hc) iic_rddb[bcnt+1'b1] <= sda;
					sdar <= 1'b1;
				end	
			D5ACK:  begin
					if(scl_lc) begin 
							sdar <= 1'b0;
							sdalink <= 1'b1;
						end
				end
			DSTOP: begin
					if(scl_lc) begin 
						sdalink <= 1'b1;	//output
						sdar <= 1'b0;
					end
					else if(scl_hc) sdar <= 1'b1;
				end
			default: ;
			endcase
	end

assign sda = sdalink ? sdar : 1'bz;
wire iic_ack = (dnstate == DSTOP) && scl_hs;	//IIC操作响应，高电平有效

//-------------------------------------------------------
//简单的IIC控制指令发送和接收
parameter	WIRST	= 4'd0,
			WA0DWR	= 4'd1,	//write 8'h0d addr
			WIDLE	= 4'd2,
			WA00RD	= 4'd3;	//read 8'h00 addr

reg[3:0] wcstate,wnstate;

	//工作状态迁移
always @(posedge clk or negedge rst_n)
	if(!rst_n) wnstate <= WIRST;
	else wnstate <= wcstate;

	//状态控制
always @(wnstate or tiic_en or iic_ack) begin
	case(wnstate)
		WIRST:	if(tiic_en) wcstate <= WA0DWR;
				else wcstate <= WIRST;
		WA0DWR: if(iic_ack) wcstate <= WIRST;
				else wcstate <= WA0DWR;
		default: wcstate <= WIRST;
		endcase
end
	
	//IIC读写请求信号产生
always @(posedge clk or negedge rst_n)
	if(!rst_n) begin
			iicwr_req <= 1'b0;
			iicrd_req <= 1'b0;
		end
	else begin
		case(wnstate)
			WIRST:  if(tiic_en) begin
						iicwr_req <= 1'b1;
						iicrd_req <= 1'b0;
					end
			WA0DWR: if(iic_ack) begin
						iicrd_req <= 1'b0;
						iicwr_req <= 1'b0;
					end	
					else begin
						iicwr_req <= 1'b1;
						iicrd_req <= 1'b0;
					end 
			default: begin
					iicwr_req <= 1'b0;
					iicrd_req <= 1'b0;
				end
			endcase	
		end			
		

endmodule
