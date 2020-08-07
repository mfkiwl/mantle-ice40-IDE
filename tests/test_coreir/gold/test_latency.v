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
    parameter sync_read = 1'b0,
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
  reg [width-1:0] data [depth-1:0];
  parameter [width*depth-1:0] init = 0;
  generate if (has_init) begin
    genvar j;
    for (j = 0; j < depth; j = j + 1) begin
      initial begin
        data[j] = init[(j+1)*width-1:j*width];
      end
    end
  end
  endgenerate
  always @(posedge clk) begin
    if (wen) begin
      data[waddr] <= wdata;
    end
  end
  generate if (sync_read) begin
  reg [width-1:0] rdata_reg;
  always @(posedge clk) begin
    rdata_reg <= data[raddr];
  end
  assign rdata = rdata_reg;
  end else begin
  assign rdata = data[raddr];
  end
  endgenerate

endmodule

module RAM256x16 (
    input [7:0] RADDR,
    output [15:0] RDATA,
    input [7:0] WADDR,
    input [15:0] WDATA,
    input CLK,
    input WE
);
wire coreir_mem256x16_inst0_clk;
wire [15:0] coreir_mem256x16_inst0_wdata;
wire [7:0] coreir_mem256x16_inst0_waddr;
wire coreir_mem256x16_inst0_wen;
wire [15:0] coreir_mem256x16_inst0_rdata;
wire [7:0] coreir_mem256x16_inst0_raddr;
wire reg_P_inst0_clk;
wire [15:0] reg_P_inst0_in;
wire [15:0] reg_P_inst0_out;
assign coreir_mem256x16_inst0_clk = CLK;
assign coreir_mem256x16_inst0_wdata = WDATA;
assign coreir_mem256x16_inst0_waddr = WADDR;
assign coreir_mem256x16_inst0_wen = WE;
assign coreir_mem256x16_inst0_raddr = RADDR;
coreir_mem #(
    .depth(256),
    .has_init(1'b0),
    .sync_read(1'b0),
    .width(16)
) coreir_mem256x16_inst0 (
    .clk(coreir_mem256x16_inst0_clk),
    .wdata(coreir_mem256x16_inst0_wdata),
    .waddr(coreir_mem256x16_inst0_waddr),
    .wen(coreir_mem256x16_inst0_wen),
    .rdata(coreir_mem256x16_inst0_rdata),
    .raddr(coreir_mem256x16_inst0_raddr)
);
assign reg_P_inst0_clk = CLK;
assign reg_P_inst0_in = coreir_mem256x16_inst0_rdata;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(16'h0000),
    .width(16)
) reg_P_inst0 (
    .clk(reg_P_inst0_clk),
    .in(reg_P_inst0_in),
    .out(reg_P_inst0_out)
);
assign RDATA = reg_P_inst0_out;
endmodule

