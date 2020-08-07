module lutN #(
    parameter N = 1,
    parameter init = 1
) (
    input [N-1:0] in,
    output out
);
  assign out = init[in];
endmodule

module LUT2_8 (
    input I0,
    input I1,
    output O
);
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h8),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(O)
);
endmodule

module LUT2_4 (
    input I0,
    input I1,
    output O
);
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h4),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(O)
);
endmodule

module LUT2_2 (
    input I0,
    input I1,
    output O
);
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h2),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(O)
);
endmodule

module LUT2_1 (
    input I0,
    input I1,
    output O
);
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h1),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(O)
);
endmodule

module Decoder2 (
    input [1:0] I,
    output [3:0] O
);
wire LUT2_1_inst0_I0;
wire LUT2_1_inst0_I1;
wire LUT2_1_inst0_O;
wire LUT2_2_inst0_I0;
wire LUT2_2_inst0_I1;
wire LUT2_2_inst0_O;
wire LUT2_4_inst0_I0;
wire LUT2_4_inst0_I1;
wire LUT2_4_inst0_O;
wire LUT2_8_inst0_I0;
wire LUT2_8_inst0_I1;
wire LUT2_8_inst0_O;
assign LUT2_1_inst0_I0 = I[0];
assign LUT2_1_inst0_I1 = I[1];
LUT2_1 LUT2_1_inst0 (
    .I0(LUT2_1_inst0_I0),
    .I1(LUT2_1_inst0_I1),
    .O(LUT2_1_inst0_O)
);
assign LUT2_2_inst0_I0 = I[0];
assign LUT2_2_inst0_I1 = I[1];
LUT2_2 LUT2_2_inst0 (
    .I0(LUT2_2_inst0_I0),
    .I1(LUT2_2_inst0_I1),
    .O(LUT2_2_inst0_O)
);
assign LUT2_4_inst0_I0 = I[0];
assign LUT2_4_inst0_I1 = I[1];
LUT2_4 LUT2_4_inst0 (
    .I0(LUT2_4_inst0_I0),
    .I1(LUT2_4_inst0_I1),
    .O(LUT2_4_inst0_O)
);
assign LUT2_8_inst0_I0 = I[0];
assign LUT2_8_inst0_I1 = I[1];
LUT2_8 LUT2_8_inst0 (
    .I0(LUT2_8_inst0_I0),
    .I1(LUT2_8_inst0_I1),
    .O(LUT2_8_inst0_O)
);
assign O = {LUT2_8_inst0_O,LUT2_4_inst0_O,LUT2_2_inst0_O,LUT2_1_inst0_O};
endmodule

