module coreir_slt #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = $signed(in0) < $signed(in1);
endmodule

module coreir_slt2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output O
);
wire coreir_slt2_inst0_out;
coreir_slt #(
    .width(2)
) coreir_slt2_inst0 (
    .in0(I0),
    .in1(I1),
    .out(coreir_slt2_inst0_out)
);
assign O = coreir_slt2_inst0_out;
endmodule

