module Add4_cout_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT,
    input CIN
);
wire [4:0] coreir_add5_inst0_out;
assign coreir_add5_inst0_out = 5'((5'(({1'b0,1'b0,1'b0,1'b0,CIN}) + ({1'b0,I0[3:0]}))) + ({1'b0,I1[3:0]}));
assign O = coreir_add5_inst0_out[3:0];
assign COUT = coreir_add5_inst0_out[4];
endmodule

module Sub4_cout_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT,
    input CIN
);
wire [3:0] Add4_cout_cin_inst0_I0;
wire [3:0] Add4_cout_cin_inst0_I1;
wire Add4_cout_cin_inst0_CIN;
assign Add4_cout_cin_inst0_I0 = I0;
assign Add4_cout_cin_inst0_I1 = ~ I1;
assign Add4_cout_cin_inst0_CIN = ~ CIN;
Add4_cout_cin Add4_cout_cin_inst0 (
    .I0(Add4_cout_cin_inst0_I0),
    .I1(Add4_cout_cin_inst0_I1),
    .O(O),
    .COUT(COUT),
    .CIN(Add4_cout_cin_inst0_CIN)
);
endmodule

