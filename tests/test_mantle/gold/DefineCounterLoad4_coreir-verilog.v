module coreir_reg #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input [width-1:0] in,
    output [width-1:0] out
);
  reg [width-1:0] outReg=init;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk) begin
    outReg <= in;
  end
  assign out = outReg;
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

module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out
);
  assign out = value;
endmodule

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

module commonlib_muxn__N2__width4 (
    input [3:0] in_data [1:0],
    input [0:0] in_sel,
    output [3:0] out
);
wire [3:0] _join_out;
coreir_mux #(
    .width(4)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module Mux2x4 (
    input [3:0] I0,
    input [3:0] I1,
    input S,
    output [3:0] O
);
wire [3:0] coreir_commonlib_mux2x4_inst0_out;
wire [3:0] coreir_commonlib_mux2x4_inst0_in_data [1:0];
assign coreir_commonlib_mux2x4_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x4_inst0_in_data[0] = I0;
wire [0:0] coreir_commonlib_mux2x4_inst0_in_sel;
assign coreir_commonlib_mux2x4_inst0_in_sel[0] = S;
commonlib_muxn__N2__width4 coreir_commonlib_mux2x4_inst0 (
    .in_data(coreir_commonlib_mux2x4_inst0_in_data),
    .in_sel(coreir_commonlib_mux2x4_inst0_in_sel),
    .out(coreir_commonlib_mux2x4_inst0_out)
);
assign O = coreir_commonlib_mux2x4_inst0_out;
endmodule

module DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse (
    input I,
    output O,
    input CLK
);
wire [0:0] reg_P_inst0_out;
wire [0:0] reg_P_inst0_in;
assign reg_P_inst0_in[0] = I;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) reg_P_inst0 (
    .clk(CLK),
    .in(reg_P_inst0_in),
    .out(reg_P_inst0_out)
);
assign O = reg_P_inst0_out[0];
endmodule

module Register4 (
    input [3:0] I,
    output [3:0] O,
    input CLK
);
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O;
wire DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O;
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0 (
    .I(I[0]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1 (
    .I(I[1]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2 (
    .I(I[2]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O),
    .CLK(CLK)
);
DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3 (
    .I(I[3]),
    .O(DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O),
    .CLK(CLK)
);
assign O = {DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst3_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst2_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst1_O,DFF_init0_has_ceFalse_has_resetFalse_has_async_resetFalse_inst0_O};
endmodule

module Add4_cout (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT
);
wire bit_const_0_None_out;
wire [4:0] coreir_add5_inst0_out;
corebit_const #(
    .value(1'b0)
) bit_const_0_None (
    .out(bit_const_0_None_out)
);
wire [4:0] coreir_add5_inst0_in0;
assign coreir_add5_inst0_in0 = {bit_const_0_None_out,I0[3:0]};
wire [4:0] coreir_add5_inst0_in1;
assign coreir_add5_inst0_in1 = {bit_const_0_None_out,I1[3:0]};
coreir_add #(
    .width(5)
) coreir_add5_inst0 (
    .in0(coreir_add5_inst0_in0),
    .in1(coreir_add5_inst0_in1),
    .out(coreir_add5_inst0_out)
);
assign O = coreir_add5_inst0_out[3:0];
assign COUT = coreir_add5_inst0_out[4];
endmodule

module CounterLoad4_COUT (
    input [3:0] DATA,
    input LOAD,
    output [3:0] O,
    output COUT,
    input CLK
);
wire [3:0] Add4_cout_inst0_O;
wire Add4_cout_inst0_COUT;
wire [3:0] Mux2x4_inst0_O;
wire [3:0] Register4_inst0_O;
wire [3:0] const_1_4_out;
Add4_cout Add4_cout_inst0 (
    .I0(Register4_inst0_O),
    .I1(const_1_4_out),
    .O(Add4_cout_inst0_O),
    .COUT(Add4_cout_inst0_COUT)
);
Mux2x4 Mux2x4_inst0 (
    .I0(Add4_cout_inst0_O),
    .I1(DATA),
    .S(LOAD),
    .O(Mux2x4_inst0_O)
);
Register4 Register4_inst0 (
    .I(Mux2x4_inst0_O),
    .O(Register4_inst0_O),
    .CLK(CLK)
);
coreir_const #(
    .value(4'h1),
    .width(4)
) const_1_4 (
    .out(const_1_4_out)
);
assign O = Register4_inst0_O;
assign COUT = Add4_cout_inst0_COUT;
endmodule

