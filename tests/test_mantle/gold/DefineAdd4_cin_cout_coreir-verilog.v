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

module Add4_cout_cin (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT,
    input CIN
);
wire bit_const_0_None_out;
wire [4:0] coreir_add5_inst0_out;
wire [4:0] coreir_add5_inst1_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
coreir_add #(
    .width(5)
) coreir_add5_inst0 (
    .in0(coreir_add5_inst1_out),
    .in1({bit_const_0_None_out,I1[3],I1[2],I1[1],I1[0]}),
    .out(coreir_add5_inst0_out)
);
coreir_add #(
    .width(5)
) coreir_add5_inst1 (
    .in0({bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,bit_const_0_None_out,CIN}),
    .in1({bit_const_0_None_out,I0[3],I0[2],I0[1],I0[0]}),
    .out(coreir_add5_inst1_out)
);
assign O = {coreir_add5_inst0_out[3],coreir_add5_inst0_out[2],coreir_add5_inst0_out[1],coreir_add5_inst0_out[0]};
assign COUT = coreir_add5_inst0_out[4];
endmodule

