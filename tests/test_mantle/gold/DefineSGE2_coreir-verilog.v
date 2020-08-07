module coreir_sge #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = $signed(in0) >= $signed(in1);
endmodule

module coreir_sge2_wrapped (
    input [1:0] I0,
    input [1:0] I1,
    output O
);
wire [1:0] coreir_sge2_inst0_in0;
wire [1:0] coreir_sge2_inst0_in1;
wire coreir_sge2_inst0_out;
assign coreir_sge2_inst0_in0 = I0;
assign coreir_sge2_inst0_in1 = I1;
coreir_sge #(
    .width(2)
) coreir_sge2_inst0 (
    .in0(coreir_sge2_inst0_in0),
    .in1(coreir_sge2_inst0_in1),
    .out(coreir_sge2_inst0_out)
);
assign O = coreir_sge2_inst0_out;
endmodule

