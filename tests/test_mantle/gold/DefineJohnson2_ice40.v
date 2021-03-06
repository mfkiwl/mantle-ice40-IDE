module Johnson2 (output [1:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_LUT4_inst0_O;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(SB_LUT4_inst0_O), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(SB_DFF_inst0_Q), .Q(SB_DFF_inst1_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) SB_LUT4_inst0 (.I0(SB_DFF_inst1_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = {SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

