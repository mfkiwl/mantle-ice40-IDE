module coreir_slice #(
    parameter hi = 1,
    parameter lo = 0,
    parameter width = 1
) (
    input [width-1:0] in,
    output [hi-lo-1:0] out
);
  assign out = in[hi-1:lo];
endmodule

module coreir_mux #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    input sel,
    output [width-1:0] out
);
  assign out = sel ? in1 : in0;
endmodule

module commonlib_muxn__N2__width1 (
    input [0:0] in_data [1:0],
    input [0:0] in_sel,
    output [0:0] out
);
wire [0:0] _join_in0;
wire [0:0] _join_in1;
wire _join_sel;
wire [0:0] _join_out;
assign _join_in0 = in_data[0];
assign _join_in1 = in_data[1];
assign _join_sel = in_sel[0];
coreir_mux #(
    .width(1)
) _join (
    .in0(_join_in0),
    .in1(_join_in1),
    .sel(_join_sel),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N4__width1 (
    input [0:0] in_data [3:0],
    input [1:0] in_sel,
    output [0:0] out
);
wire [0:0] _join_in0;
wire [0:0] _join_in1;
wire _join_sel;
wire [0:0] _join_out;
wire [0:0] muxN_0_in_data [1:0];
wire [0:0] muxN_0_in_sel;
wire [0:0] muxN_0_out;
wire [0:0] muxN_1_in_data [1:0];
wire [0:0] muxN_1_in_sel;
wire [0:0] muxN_1_out;
wire [1:0] sel_slice0_in;
wire [0:0] sel_slice0_out;
wire [1:0] sel_slice1_in;
wire [0:0] sel_slice1_out;
assign _join_in0 = muxN_0_out;
assign _join_in1 = muxN_1_out;
assign _join_sel = in_sel[1];
coreir_mux #(
    .width(1)
) _join (
    .in0(_join_in0),
    .in1(_join_in1),
    .sel(_join_sel),
    .out(_join_out)
);
assign muxN_0_in_data[1] = in_data[1];
assign muxN_0_in_data[0] = in_data[0];
assign muxN_0_in_sel = sel_slice0_out;
commonlib_muxn__N2__width1 muxN_0 (
    .in_data(muxN_0_in_data),
    .in_sel(muxN_0_in_sel),
    .out(muxN_0_out)
);
assign muxN_1_in_data[1] = in_data[3];
assign muxN_1_in_data[0] = in_data[2];
assign muxN_1_in_sel = sel_slice1_out;
commonlib_muxn__N2__width1 muxN_1 (
    .in_data(muxN_1_in_data),
    .in_sel(muxN_1_in_sel),
    .out(muxN_1_out)
);
assign sel_slice0_in = in_sel;
coreir_slice #(
    .hi(1),
    .lo(0),
    .width(2)
) sel_slice0 (
    .in(sel_slice0_in),
    .out(sel_slice0_out)
);
assign sel_slice1_in = in_sel;
coreir_slice #(
    .hi(1),
    .lo(0),
    .width(2)
) sel_slice1 (
    .in(sel_slice1_in),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N8__width1 (
    input [0:0] in_data [7:0],
    input [2:0] in_sel,
    output [0:0] out
);
wire [0:0] _join_in0;
wire [0:0] _join_in1;
wire _join_sel;
wire [0:0] _join_out;
wire [0:0] muxN_0_in_data [3:0];
wire [1:0] muxN_0_in_sel;
wire [0:0] muxN_0_out;
wire [0:0] muxN_1_in_data [3:0];
wire [1:0] muxN_1_in_sel;
wire [0:0] muxN_1_out;
wire [2:0] sel_slice0_in;
wire [1:0] sel_slice0_out;
wire [2:0] sel_slice1_in;
wire [1:0] sel_slice1_out;
assign _join_in0 = muxN_0_out;
assign _join_in1 = muxN_1_out;
assign _join_sel = in_sel[2];
coreir_mux #(
    .width(1)
) _join (
    .in0(_join_in0),
    .in1(_join_in1),
    .sel(_join_sel),
    .out(_join_out)
);
assign muxN_0_in_data[3] = in_data[3];
assign muxN_0_in_data[2] = in_data[2];
assign muxN_0_in_data[1] = in_data[1];
assign muxN_0_in_data[0] = in_data[0];
assign muxN_0_in_sel = sel_slice0_out;
commonlib_muxn__N4__width1 muxN_0 (
    .in_data(muxN_0_in_data),
    .in_sel(muxN_0_in_sel),
    .out(muxN_0_out)
);
assign muxN_1_in_data[3] = in_data[7];
assign muxN_1_in_data[2] = in_data[6];
assign muxN_1_in_data[1] = in_data[5];
assign muxN_1_in_data[0] = in_data[4];
assign muxN_1_in_sel = sel_slice1_out;
commonlib_muxn__N4__width1 muxN_1 (
    .in_data(muxN_1_in_data),
    .in_sel(muxN_1_in_sel),
    .out(muxN_1_out)
);
assign sel_slice0_in = in_sel;
coreir_slice #(
    .hi(2),
    .lo(0),
    .width(3)
) sel_slice0 (
    .in(sel_slice0_in),
    .out(sel_slice0_out)
);
assign sel_slice1_in = in_sel;
coreir_slice #(
    .hi(2),
    .lo(0),
    .width(3)
) sel_slice1 (
    .in(sel_slice1_in),
    .out(sel_slice1_out)
);
assign out = _join_out;
endmodule

module Mux8xNone (
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input [2:0] S,
    output O
);
wire [0:0] coreir_commonlib_mux8x1_inst0_in_data [7:0];
wire [2:0] coreir_commonlib_mux8x1_inst0_in_sel;
wire [0:0] coreir_commonlib_mux8x1_inst0_out;
assign coreir_commonlib_mux8x1_inst0_in_data[7] = I7;
assign coreir_commonlib_mux8x1_inst0_in_data[6] = I6;
assign coreir_commonlib_mux8x1_inst0_in_data[5] = I5;
assign coreir_commonlib_mux8x1_inst0_in_data[4] = I4;
assign coreir_commonlib_mux8x1_inst0_in_data[3] = I3;
assign coreir_commonlib_mux8x1_inst0_in_data[2] = I2;
assign coreir_commonlib_mux8x1_inst0_in_data[1] = I1;
assign coreir_commonlib_mux8x1_inst0_in_data[0] = I0;
assign coreir_commonlib_mux8x1_inst0_in_sel = S;
commonlib_muxn__N8__width1 coreir_commonlib_mux8x1_inst0 (
    .in_data(coreir_commonlib_mux8x1_inst0_in_data),
    .in_sel(coreir_commonlib_mux8x1_inst0_in_sel),
    .out(coreir_commonlib_mux8x1_inst0_out)
);
assign O = coreir_commonlib_mux8x1_inst0_out[0];
endmodule

