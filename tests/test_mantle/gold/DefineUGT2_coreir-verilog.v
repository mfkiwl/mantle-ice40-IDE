module coreir_ugt #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 > in1;
endmodule

module coreir_ugt2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output O
);
wire [1:0] coreir_ugt2_inst0_in0;
wire [1:0] coreir_ugt2_inst0_in1;
wire coreir_ugt2_inst0_out;
assign coreir_ugt2_inst0_in0 = I0;
assign coreir_ugt2_inst0_in1 = I1;
coreir_ugt #(
    .width(2)
) coreir_ugt2_inst0 (
    .in0(coreir_ugt2_inst0_in0),
    .in1(coreir_ugt2_inst0_in1),
    .out(coreir_ugt2_inst0_out)
);
assign O = coreir_ugt2_inst0_out;
endmodule

