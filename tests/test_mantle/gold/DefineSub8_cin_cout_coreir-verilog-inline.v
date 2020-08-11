module Add8_cout_cin (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT,
    input CIN
);
wire [8:0] coreir_add9_inst0_out;
assign coreir_add9_inst0_out = 9'((9'(({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,CIN}) + ({1'b0,I0[7:0]}))) + ({1'b0,I1[7:0]}));
assign O = coreir_add9_inst0_out[7:0];
assign COUT = coreir_add9_inst0_out[8];
endmodule

module Sub8_cout_cin (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT,
    input CIN
);
wire [7:0] Invert8_inst0_out;
wire not_inst0_out;
Add8_cout_cin Add8_cout_cin_inst0 (
    .I0(I0),
    .I1(Invert8_inst0_out),
    .O(O),
    .COUT(COUT),
    .CIN(not_inst0_out)
);
assign Invert8_inst0_out = ~ I1;
assign not_inst0_out = ~ CIN;
endmodule

