module coreir_add #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 + in1;
endmodule

module corebit_const #(
    parameter value = 1
) (
    output out
);
  assign out = value;
endmodule

module Add8_cin (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    input CIN
);
wire bit_const_0_None_out;
wire [7:0] coreir_add8_inst0_out;
wire [7:0] coreir_add8_inst1_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
coreir_add #(
    .width(8)
) coreir_add8_inst0 (
    .in0(coreir_add8_inst1_out),
    .in1(I1),
    .out(coreir_add8_inst0_out)
);
wire [7:0] coreir_add8_inst1_in0;
assign coreir_add8_inst1_in0 = {bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,CIN};
coreir_add #(
    .width(8)
) coreir_add8_inst1 (
    .in0(coreir_add8_inst1_in0),
    .in1(I0),
    .out(coreir_add8_inst1_out)
);
assign O = coreir_add8_inst0_out;
endmodule

