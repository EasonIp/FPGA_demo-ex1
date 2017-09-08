module ex5(
			clk,rst_n,
			seg_db,seg_cs
		);
input clk;																
input rst_n;	
output reg[7:0] seg_db;														
output reg[3:0] seg_cs;														

//-------------------------------------
reg[24:0] cnt;																

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) cnt <= 25'd0;
	else if(cnt >= 25'd25_000_000) cnt <= 25'd0;
	else cnt <= cnt+1'b1;						
	
wire timer_1s = (cnt == 25'd25_000_000);									

//-------------------------------------
reg[15:0] dis_db;															

always @ (posedge clk or negedge rst_n)										
	if(!rst_n) dis_db <= 16'd0;
	else if(timer_1s) dis_db <= dis_db+1'b1;
	else ;		

//-------------------------------------
reg[3:0] cur_disdb;															
	
always @ (posedge clk or negedge rst_n) 									
	if(!rst_n) cur_disdb <= 4'd0;
	else begin
		case(cnt[7:6])
			2'b00: begin													
					seg_cs <= 4'b1110;
					cur_disdb <= dis_db[3:0];
				end
			2'b01: begin												
					seg_cs <= 4'b1101; 
					cur_disdb <= dis_db[7:4];
				end
			2'b10: begin												
					seg_cs <= 4'b1011; 
					cur_disdb <= dis_db[11:8];
				end
			2'b11: begin													
					seg_cs <= 4'b0111; 
					cur_disdb <= dis_db[15:12];
				end
			default: ;
		endcase
	end				

//-------------------------------------------------
parameter 	SEG_NUM0 	= 8'h3f,//c0,										
			SEG_NUM1 	= 8'h06,//f9,
			SEG_NUM2 	= 8'h5b,//a4,
			SEG_NUM3 	= 8'h4f,//b0,
			SEG_NUM4 	= 8'h66,//99,
			SEG_NUM5 	= 8'h6d,//92,
			SEG_NUM6 	= 8'h7d,//82,
			SEG_NUM7 	= 8'h07,//F8,
			SEG_NUM8 	= 8'h7f,//80,
			SEG_NUM9 	= 8'h6f,//90,
			SEG_NUMA 	= 8'h77,//88,
			SEG_NUMB 	= 8'h7c,//83,
			SEG_NUMC 	= 8'h39,//c6,
			SEG_NUMD 	= 8'h5e,//a1,
			SEG_NUME 	= 8'h79,//86,
			SEG_NUMF 	= 8'h71;//8e;	

always @(cur_disdb) begin												
	case(cur_disdb) 
		4'h0: seg_db <= SEG_NUM0;
		4'h1: seg_db <= SEG_NUM1;
		4'h2: seg_db <= SEG_NUM2;
		4'h3: seg_db <= SEG_NUM3;
		4'h4: seg_db <= SEG_NUM4;
		4'h5: seg_db <= SEG_NUM5;
		4'h6: seg_db <= SEG_NUM6;
		4'h7: seg_db <= SEG_NUM7;
		4'h8: seg_db <= SEG_NUM8;
		4'h9: seg_db <= SEG_NUM9;
		4'ha: seg_db <= SEG_NUMA;
		4'hb: seg_db <= SEG_NUMB;
		4'hc: seg_db <= SEG_NUMC;
		4'hd: seg_db <= SEG_NUMD;
		4'he: seg_db <= SEG_NUME;
		4'hf: seg_db <= SEG_NUMF;
		default: ;
	endcase			
end			
			
endmodule
