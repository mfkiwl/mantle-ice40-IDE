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

module coreir_mem #(
    parameter has_init = 1'b0,
    parameter depth = 1,
    parameter width = 1
) (
    input clk,
    input [width-1:0] wdata,
    input [$clog2(depth)-1:0] waddr,
    input wen,
    output [width-1:0] rdata,
    input [$clog2(depth)-1:0] raddr
);
  reg [width-1:0] data[depth-1:0];
  always @(posedge clk) begin
    if (wen) begin
      data[waddr] <= wdata;
    end
  end
  assign rdata = data[raddr];
endmodule

module RAM256x16 (
    input [7:0] RADDR,
    output [15:0] RDATA,
    input [7:0] WADDR,
    input [15:0] WDATA,
    input CLK,
    input WE
);
wire [15:0] coreir_mem256x16_inst0_rdata;
wire [15:0] reg_P_inst0_out;
coreir_mem #(
    .depth(256),
    .has_init(1'b0),
    .width(16)
) coreir_mem256x16_inst0 (
    .clk(CLK),
    .wdata(WDATA),
    .waddr(WADDR),
    .wen(WE),
    .rdata(coreir_mem256x16_inst0_rdata),
    .raddr(RADDR)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(16'h0000),
    .width(16)
) reg_P_inst0 (
    .clk(CLK),
    .in(coreir_mem256x16_inst0_rdata),
    .out(reg_P_inst0_out)
);
assign RDATA = reg_P_inst0_out;
endmodule

