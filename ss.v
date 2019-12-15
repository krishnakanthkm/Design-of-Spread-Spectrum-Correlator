module ss (clk,reset,din,dout,addr,strobe,samp,push_samp,sync,push_corr,corr);
input clk;
input reset;
input [31:0] din;
output [31:0] dout;
input [3:0] addr;
input strobe;
input signed [11:0] samp;
input push_samp;
input sync;
output push_corr;
output signed [31:0] corr;

reg push1,push1_d,push2,push2_d,push3,push4,push5,push6,push3_d,push4_d,push5_d,push6_d,push7,push7_d;
reg [31:0] din_d,din_1,dout_d,dout_1;
reg [31:0] freq_d,freq,phase_d,phase,phase1,phase1_d;
reg [3:0] s1,s2,s1_d,s2_d,s1t,s2t,s1t_d,s2t_d,s1t2,s2t2,s1t2_d,s2t2_d;
reg strobe_d,strobe_1,sync_d,sync_1,sync_2,sync2_d,sync_3,sync3_d,sync_4,sync4_d,sync_5,sync5_d;
reg signed [11:0] samp_d,samp_1,samp2_d,samp_2,samp3_d,samp_3,samp4_d,samp_4,samp_5,samp5_d;
reg [3:0] addr_d,addr_1;
reg [9:0] g1,g2,g1_d,g2_d;
reg g1_feed,g2_feed,g1_out,g2_out,gout,gout_d,gout1,gout1_d;
reg [10:0] count,count_d,count1,count1_d,count2,count2_d,count3,count3_d,count4,count4_d;
reg flag, flag_d,cflag,cflag_d,flag1,flag1_d,flag2,flag2_d;
reg [31:0] acc,acc_d;
reg signed [31:0] corr_1, sum, sum_d,corr_d;

assign corr = corr_1;
assign push_corr = push7;
assign dout = dout_1;

always@(*) begin
	push1_d = push_samp;
	push2_d = push1;
	push3_d = push2;
	push4_d = push3;
	push5_d = push4;
	push6_d = push5;

end

always@(*) begin
	din_d = din;
	samp_d = samp;
	sync_d = sync;
	strobe_d = strobe;
	addr_d = addr;

	samp2_d = samp_1;
	samp3_d = samp_2;
	samp4_d = samp_3;
	samp5_d = samp_4;

	if(strobe_1) begin
		freq_d = freq;
		phase_d = phase;
		s1_d = s1;
		s2_d = s2;
		case(addr_1)
			0:freq_d = din_1;
			4:phase_d = din_1;
			8:s1_d = din_1;
			12:s2_d = din_1;
		endcase
	end
	else begin
		freq_d = freq;
		phase_d = phase;
		s1_d = s1;
		s2_d = s2;
	end

	case(addr_1)
		0:dout_d = freq_d;
		4:dout_d = phase_d;
		8:dout_d = s1_d;
		12:dout_d = s2_d;
		default: dout_d = dout_1;
	endcase
	
	sync2_d = sync_1;

	
	if(sync_2) begin
		acc_d = phase;
		count_d = 0;
		flag_d = 0;
	end
	else if(push2) begin
			acc_d = acc + freq;
			count_d = count;
			flag_d = 0;
				if(acc_d>100000000) begin
					acc_d = acc_d - 100000000;
					flag_d = 1;
					count_d = count + 1;
						if(count_d == 1025) count_d = 2;
						else count_d = count_d;
				end
				else begin
					acc_d = acc_d;
					flag_d = 0;
					count_d = count_d;
				end		
		end
	else begin
		acc_d = acc;
		count_d = count;
		flag_d = 0;
	end


	sync3_d = sync_2;
	phase1_d = phase;
	s1t_d = s1;
	s2t_d = s2;

	if(sync_3) begin
		g1_d = 1023;
		g2_d = 1023;
	end 
	else if(flag) begin
		g1_feed = (g1[7]^g1[0]);
		g2_feed = (g2[8]^g2[7]^g2[4]^g2[2]^g2[1]^g2[0]);
		g1_d = g1 >> 1;
		g2_d = g2 >> 1;		
		g1_d[9] = g1_feed;
		g2_d[9] = g2_feed;
	end
	else begin
		g1_feed = g1_feed;
		g2_feed = g2_feed;
		g1_d = g1;
		g2_d = g2;
	end
	
	g2_out = (g2[9-(s1t2-1)]^g2[9-(s2t2-1)]);
	g1_out = g1[0];
	gout_d = (g1_out^g2_out);
				
	
	s1t2_d = s1t;
	s2t2_d = s2t;
	
	flag1_d = flag;
	count1_d = count;

	flag2_d = flag1;
	count2_d = count1;
	
	count3_d = count2;
	count4_d = count3;
	gout1_d = gout;
		
	sync4_d = sync_3;
	sync5_d = sync_4;
	
	if(count3 == 1023) cflag_d =1;
	else cflag_d = cflag;
	if(count4 == 1023) cflag_d = 0;
	else cflag_d = cflag_d;	

	if(sync_5==1) sum_d = 0;
	else if(push5==1) begin
		if(cflag_d==1) begin
			if(gout1==1) begin
				sum_d = 0 + samp_5;
			end
			else begin
				sum_d = 0 - samp_5;
			end
		end
		else begin
			if(gout1==1) begin
				sum_d = sum + samp_5;
			end
			else begin
				sum_d = sum - samp_5;
			end
		end
	end
	else begin
		if(cflag_d==1) sum_d = 0;
		else sum_d = sum;
	end

	corr_d = sum;
	if(count3==1023) push7_d = 1;
	else push7_d = push7;
	if(count4==1023) push7_d = 0;

end



always@(posedge(clk) or posedge(reset)) begin
	if(reset)begin
		din_1<=0;
		samp_1<=0;
		sync_1<=0;
		strobe_1<=0;
		addr_1<=0;
		push1<=0;
	end
	else begin
		din_1<= #1 din_d;
		samp_1<= #1 samp_d;
		sync_1<= #1 sync_d;
		strobe_1<= #1 strobe_d;
		addr_1<= #1 addr_d;
		push1<= #1 push1_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin
		freq<=0;
		phase<=0;
		s1<=0;
		s2<=0;
		dout_1<=0;
		sync_2<=0;
		samp_2<=0;
		push2<=0;
	end
	else begin
		freq<= #1 freq_d;
		phase<= #1 phase_d;
		s1<= #1 s1_d;
		s2<= #1 s2_d;
		dout_1<= #1 dout_d;
		sync_2<= #1 sync2_d;
		samp_2<= #1 samp2_d;
		push2<= #1 push2_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin
		acc<=0;
		count<=0;
		flag<=0;
		sync_3<=0;
		phase1<=0;
		samp_3<=0;
		s1t<=0;
		s2t<=0;
		push3<=0;
	end
	else begin
		acc<= #1 acc_d;
		count<= #1 count_d;
		flag<= #1 flag_d;
		sync_3<= #1 sync3_d;
		phase1<= #1 phase1_d;
		samp_3<= #1 samp3_d;
		s1t<= #1 s1t_d;
		s2t<= #1 s2t_d;
		push3<= #1 push3_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin	
		samp_4<=0;
		g1<=0;
		g2<=0;
		g1_feed<=0;
		g2_feed<=0;
		s1t2<=0;
		s2t2<=0;
		count1<=0;
		flag1<=0;
		flag2<=0;
		count2<=0;
		sync_4<=0;
		push4<=0;
	end
	else begin
		samp_4<= #1 samp4_d;
		g1<= #1 g1_d;
		g2<= #1 g2_d;
		g1_feed<= #1 g1_feed;
		g2_feed<= #1 g2_feed;		
		s1t2<= #1 s1t2_d;
		s2t2<= #1 s2t2_d;
		count1<= #1 count1_d;
		flag1<= #1 flag1_d;
		flag2<= #1 flag2_d;
		count2<= #1 count2_d;
		sync_4<= #1 sync4_d;
		push4<= #1 push4_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin
		gout<=0;
		samp_5<=0;
		cflag<=0;
		count3<=0;
		sync_5<=0;
		push5<=0;
	end
	else begin
		gout<= #1 gout_d;
		samp_5<= #1 samp5_d;
		cflag<= #1 cflag_d;
		count3<= #1 count3_d;
		sync_5<= #1 sync5_d;
		push5<= #1 push5_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin
		sum<=0;
		gout1<=0;
		count4<=0;
		push6<=0;
	end
	else begin
		sum<= #1 sum_d;
		gout1<= #1 gout1_d;
		count4<= #1 count4_d;
		push6<= #1 push6_d;
	end
end

always@(posedge(clk) or posedge(reset))begin
	if(reset)begin
		corr_1<=0;
		push7<=0;
	end
	else begin
		corr_1<= #1 corr_d;
		push7<= #1 push7_d;
	end
end
endmodule
