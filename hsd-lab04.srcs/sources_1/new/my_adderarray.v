module adder_array (cmd, ain0, ain1, ain2, ain3, bin0, bin1, bin2, bin3, dout0, dout1, dout2, dout3, overflow);
    
    input [2:0] cmd;
    input [31:0] ain0, ain1, ain2, ain3;
    input [31:0] bin0, bin1, bin2, bin3;
    output [31:0] dout0, dout1, dout2, dout3;
    output [3:0] overflow;
    genvar i;
    
    wire [3:0] ain, bin, dout;
    assign {ain[0], ain[1], ain[2], ain[3]} = {ain0, ain1, ain2, ain3};
    assign {bin[0], bin[1], bin[2], bin[3]} = {bin0, bin1, bin2, bin3};
    assign {dout[0], dout[1], dout[2], dout[3]} = {dout0, dout1, dout2, dout3};

    generate for (i=0; i<4; i=i+1) begin : adder
        my_add ma (ain[i],bin[i],dout[i],overflow[i]);
    end endgenerate

    always @ (cmd)
        case (cmd)
            3'b000: begin dout0 = dout[0]; dout1 = 0; dout2 = 0; dout3 = 0; overflow[1] = 0; overflow[2] = 0; overflow[3] = 0; end
            3'b001: begin dout0 = 0; dout1 = dout[1]; dout2 = 0; dout3 = 0; overflow[0] = 0; overflow[2] = 0; overflow[3] = 0; end
            3'b010: begin dout0 = 0; dout1 = 0; dout2 = dout[2]; dout3 = 0; overflow[0] = 0; overflow[1] = 0; overflow[3] = 0; end
            3'b011: begin dout0 = 0; dout1 = 0; dout2 = 0; dout3 = dout[3]; overflow[0] = 0; overflow[1] = 0; overflow[2] = 0; end
            3'b100: begin dout0 = dout[0]; dout1 = dout[1]; dout2 = dout[2]; dout3 = dout[3]; end
        endcase

endmodule