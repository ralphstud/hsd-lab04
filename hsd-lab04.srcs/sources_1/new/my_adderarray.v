module adder_array (cmd, ain0, ain1, ain2, ain3, bin0, bin1, bin2, bin3, dout0, dout1, dout2, dout3, overflow);
    
    input [2:0] cmd;
    input [31:0] ain0, ain1, ain2, ain3;
    input [31:0] bin0, bin1, bin2, bin3;
    output [31:0] dout0, dout1, dout2, dout3;
    output [3:0] overflow;
    genvar i;
    
    wire [31:0] ain[3:0], bin[3:0], dout[3:0];
    wire ovf[3:0];
    assign {ain[0], ain[1], ain[2], ain[3]} = {ain0, ain1, ain2, ain3};
    assign {bin[0], bin[1], bin[2], bin[3]} = {bin0, bin1, bin2, bin3};

    generate for (i=0; i<4; i=i+1) begin : adder
            my_add ma (ain[i],bin[i],dout[i],ovf[i]);
    end endgenerate

    assign {overflow[0], dout0} = (cmd == 0 || cmd == 4) ? {ovf[0], dout[0]} : 0;
    assign {overflow[1], dout1} = (cmd == 1 || cmd == 4) ? {ovf[1], dout[1]} : 0;
    assign {overflow[2], dout2} = (cmd == 2 || cmd == 4) ? {ovf[2], dout[2]} : 0;
    assign {overflow[3], dout3} = (cmd == 3 || cmd == 4) ? {ovf[3], dout[3]} : 0;

endmodule