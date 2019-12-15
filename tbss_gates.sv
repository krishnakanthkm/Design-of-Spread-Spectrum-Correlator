// A simple test bench for the EE287 spread spectrum correlator
//
`timescale 1ns/10ps
`include "ss.v"

module top();
reg clk,reset;
reg [31:0] din;
reg [3:0] addr;
reg strobe;
reg [11:0] samp;
reg push_samp;
reg sync;
wire push_corr;
reg push_corr1;
wire [31:0] corr;
reg [31:0] corr1,edata;
wire [31:0] dout;

reg [31:0] efifo[$];



ss s(clk,reset,din,dout,addr,strobe,samp,push_samp,sync,
     push_corr,corr);

initial begin
    strobe=0;
    sync=0;
    push_samp=0;
    clk=0;
    #5;
    repeat(90000) begin
        #3 clk=1;
        #3 clk=0;
    end
    $display("\n\n\n\nRan out of clocks\n\n\n\n");
    $finish;
end
initial begin
    reset=1;
    repeat(3) @(posedge(clk)) #1;
    reset=0;
end

task die(string msg);
    $display("\n\n\n\n\n\n");
    $display("=======================================");
    $display("Around time %t",$realtime());
    $display("Error --- %s",msg);
    $display("=======================================");
    $display("\n\n\n\n\n\n");
    #20;
    $finish;
    
    

endtask : die

always @(posedge(clk)) begin
    if(!reset) begin
        if (push_corr === 1'bX) die("push_corr is X");
        if (^corr === 1'bX ) die("corr is X");
        push_corr1 = push_corr;
        corr1 = corr;
        #0.05;
        if(push_corr1 !== push_corr) die("No hold time on push_corr");
        if(corr1 !== corr) die("No hold time on corr");
        if(push_corr) begin
            if(efifo.size() < 1) die("You pushed out, and nothing expected");
            edata=efifo.pop_front();
            $display("Checking for %08h",edata);
            if(edata != corr) begin
                die($sformatf("Expecting %08h  got  %08h",edata,corr));
            end
        end
    end
end

initial begin
    integer f,junk;
    string stuff;
    reg [31:0] dx;
    reg [3:0] ax;
    int pcnt=0;
    string tfn="/home/morris/287/s19/ss/sst0.txt";
    addr=0;
    din=32'h12349876;
    f = $fopen(tfn,"r");
    if (f == 0) begin
        $display("Could not open the test pattern file %s",tfn);
        $finish;
    end
    junk = $fgets(stuff,f);
    repeat(10) @(posedge(clk)) #1;
    while( ! $feof(f) ) begin
//        $display("%s",stuff);
        case(stuff[0])
            "#":
                begin
                    pcnt += 1;
                    if(pcnt > 3) begin
                        repeat(500) @(posedge(clk)) #1;
                        if( efifo.size() != 0 ) begin
                            die("Not everything came out of the design");
                        end
                        $display("\n\n\nGreat Joy is found in completing the test\n\n\n");
                        $finish();
                    end
                    $display("%s",stuff);
                end
            "r":
                begin
                    junk=$sscanf(stuff,"%*s %x %x",ax,dx);
                    din=dx;
                    addr=ax;
                    strobe=1;
                    @(posedge(clk)) #1;
                    strobe=0;
                    din=32'h12345678;
                    addr=$urandom_range(0,15);
                end
            "O":
                begin
                    junk=$sscanf(stuff,"%*s %x",dx);
                    efifo.push_back(dx);
                end
            "b":
                begin
                    repeat(2) @(posedge(clk)) #1;
                    sync=1;
                    repeat(2) @(posedge(clk)) #1;
                    sync=0;
                    repeat(3) @(posedge(clk)) #1;
                end
            "I":
                begin
                    junk=$sscanf(stuff,"%*s %x",dx);
                    samp=dx;
                    push_samp=1;
                    @(posedge(clk)) #1;
                    push_samp=0;
                    if((pcnt>2) && ($urandom_range(100)>80)) begin
                        repeat($urandom_range(3)+1) @(posedge(clk)) #1;
                    end
                end
            "w":
                begin
                    repeat(500) @(posedge(clk)) #1;
                end
            "e":
                begin
                    repeat(500) @(posedge(clk)) #1;
                    if( efifo.size() != 0 ) begin
                        die("Not everything came out of the design");
                    end
                    $display("\n\n\nGreat Joy is found in completing the test\n\n\n");
                    $finish();
                end
            default:
                begin
                    $display("Unknown code %s",stuff);
                    $finish;
                end
        endcase 
    
        junk = $fgets(stuff,f);
    end
    
    
    
    
    $fclose(f);



end


initial begin
//    $dumpfile("ss.vpd");
//    repeat(0) @(posedge(clk));
//    $dumpvars();
//    $dumplimit(100000);
//    repeat(100000) @(posedge(clk));
//    $dumpoff;


end




endmodule : top
