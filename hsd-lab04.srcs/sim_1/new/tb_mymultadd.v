`timescale 1ns / 1ps

module tb_mymultadd();

    reg [32-1:0] ain;
    reg [32-1:0] bin;
    reg [64-1:0] cin;
    reg sclr;
    reg clk;
    reg ce;
    wire [64-1:0] res;
    
    integer i;
    
    initial begin
        clk<=0;
        sclr<=0;
        ce<=0;
        #30;
        ce<=1;
        for(i=0; i<32; i=i+1) begin
            ain = $urandom%(2**31);
            bin = $urandom%(2**31);
            cin = $urandom%(2**63);
            #10;
        end
    end
    
    always #5 clk = ~clk;
    
    xbip_multadd_mymultadd XMM (
        .clk(clk),
        .ce(ce),
        .sclr(sclr),
        .a(ain),
        .b(bin),
        .c(cin),
        .p(res)
        );
    
endmodule
