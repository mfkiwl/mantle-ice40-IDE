module coreir_xor #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 ^ in1;
endmodule

module xor8_wrapped (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O
);
wire [7:0] xor8_inst0_in0;
wire [7:0] xor8_inst0_in1;
wire [7:0] xor8_inst0_out;
assign xor8_inst0_in0 = I0;
assign xor8_inst0_in1 = I1;
coreir_xor #(
    .width(8)
) xor8_inst0 (
    .in0(xor8_inst0_in0),
    .in1(xor8_inst0_in1),
    .out(xor8_inst0_out)
);
assign O = xor8_inst0_out;
endmodule

