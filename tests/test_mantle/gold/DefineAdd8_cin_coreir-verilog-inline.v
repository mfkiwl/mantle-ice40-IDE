module Add8_cin (input CIN, input [7:0] I0, input [7:0] I1, output [7:0] O);
assign O = (({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CIN}) + I0) + I1;
endmodule

