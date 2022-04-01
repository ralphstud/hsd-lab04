`timescale 1ns / 1ps
module tb_adderarray();
    parameter BITWIDTH = 32;

    //for my IP
    reg [2:0] cmd;
    reg [BITWIDTH-1:0] ain0;
    reg [BITWIDTH-1:0] ain1;
    reg [BITWIDTH-1:0] ain2;
    reg [BITWIDTH-1:0] ain3;
    reg [BITWIDTH-1:0] bin0;
    reg [BITWIDTH-1:0] bin1;
    reg [BITWIDTH-1:0] bin2;
    reg [BITWIDTH-1:0] bin3;    
    wire [BITWIDTH-1:0] dout0;
    wire [BITWIDTH-1:0] dout1;
    wire [BITWIDTH-1:0] dout2;
    wire [BITWIDTH-1:0] dout3;
    wire [3:0] overflow;

    //for test
    integer i, j;
    //random test vector generation
    initial begin
        for(i=0; i<5; i=i+1) begin
            cmd = i;
            for (j=0; j<4; j=j+1) begin
                ain0 = $urandom%(2**31);
                ain1 = $urandom%(2**31);
                ain2 = $urandom%(2**31);
                ain3 = $urandom%(2**31);
                bin0 = $urandom%(2**31);
                bin1 = $urandom%(2**31);
                bin2 = $urandom%(2**31);
                bin3 = $urandom%(2**31);
                #20;
            end
        end
    end

    //my IP
    adder_array #(BITWIDTH) MY_ADDERARRAY(
        .cmd(cmd),
        .ain0(ain0),
        .ain1(ain1),
        .ain2(ain2),
        .ain3(ain3),
        .bin0(bin0),
        .bin1(bin1),
        .bin2(bin2),
        .bin3(bin3),
        .dout0(dout0),
        .dout1(dout1),
        .dout2(dout2),
        .dout3(dout3),
        .overflow(overflow)
    );
        
endmodule