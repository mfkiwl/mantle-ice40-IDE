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

module commonlib_muxn__N2__width4 (
    input [3:0] in_data [1:0],
    input [0:0] in_sel,
    output [3:0] out
);
wire [3:0] _join_in0;
wire [3:0] _join_in1;
wire _join_sel;
wire [3:0] _join_out;
assign _join_in0 = in_data[0];
assign _join_in1 = in_data[1];
assign _join_sel = in_sel[0];
coreir_mux #(
    .width(4)
) _join (
    .in0(_join_in0),
    .in1(_join_in1),
    .sel(_join_sel),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N4__width4 (
    input [3:0] in_data [3:0],
    input [1:0] in_sel,
    output [3:0] out
);
wire [3:0] _join_in0;
wire [3:0] _join_in1;
wire _join_sel;
wire [3:0] _join_out;
wire [3:0] muxN_0_in_data [1:0];
wire [0:0] muxN_0_in_sel;
wire [3:0] muxN_0_out;
wire [3:0] muxN_1_in_data [1:0];
wire [0:0] muxN_1_in_sel;
wire [3:0] muxN_1_out;
wire [1:0] sel_slice0_in;
wire [0:0] sel_slice0_out;
wire [1:0] sel_slice1_in;
wire [0:0] sel_slice1_out;
assign _join_in0 = muxN_0_out;
assign _join_in1 = muxN_1_out;
assign _join_sel = in_sel[1];
coreir_mux #(
    .width(4)
) _join (
    .in0(_join_in0),
    .in1(_join_in1),
    .sel(_join_sel),
    .out(_join_out)
);
assign muxN_0_in_data[1] = in_data[1];
assign muxN_0_in_data[0] = in_data[0];
assign muxN_0_in_sel = sel_slice0_out;
commonlib_muxn__N2__width4 muxN_0 (
    .in_data(muxN_0_in_data),
    .in_sel(muxN_0_in_sel),
    .out(muxN_0_out)
);
assign muxN_1_in_data[1] = in_data[3];
assign muxN_1_in_data[0] = in_data[2];
assign muxN_1_in_sel = sel_slice1_out;
commonlib_muxn__N2__width4 muxN_1 (
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

module Mux4x4 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    input [1:0] S,
    output [3:0] O
);
wire [3:0] coreir_commonlib_mux4x4_inst0_in_data [3:0];
wire [1:0] coreir_commonlib_mux4x4_inst0_in_sel;
wire [3:0] coreir_commonlib_mux4x4_inst0_out;
assign coreir_commonlib_mux4x4_inst0_in_data[3] = I3;
assign coreir_commonlib_mux4x4_inst0_in_data[2] = I2;
assign coreir_commonlib_mux4x4_inst0_in_data[1] = I1;
assign coreir_commonlib_mux4x4_inst0_in_data[0] = I0;
assign coreir_commonlib_mux4x4_inst0_in_sel = S;
commonlib_muxn__N4__width4 coreir_commonlib_mux4x4_inst0 (
    .in_data(coreir_commonlib_mux4x4_inst0_in_data),
    .in_sel(coreir_commonlib_mux4x4_inst0_in_sel),
    .out(coreir_commonlib_mux4x4_inst0_out)
);
assign O = coreir_commonlib_mux4x4_inst0_out;
endmodule

