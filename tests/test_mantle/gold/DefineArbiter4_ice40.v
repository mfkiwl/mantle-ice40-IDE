module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(CIN), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

module Add4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
wire  FullAdder_inst1_O;
wire  FullAdder_inst1_COUT;
wire  FullAdder_inst2_O;
wire  FullAdder_inst2_COUT;
wire  FullAdder_inst3_O;
wire  FullAdder_inst3_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
FullAdder FullAdder_inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(FullAdder_inst0_COUT), .O(FullAdder_inst1_O), .COUT(FullAdder_inst1_COUT));
FullAdder FullAdder_inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(FullAdder_inst1_COUT), .O(FullAdder_inst2_O), .COUT(FullAdder_inst2_COUT));
FullAdder FullAdder_inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(FullAdder_inst2_COUT), .O(FullAdder_inst3_O), .COUT(FullAdder_inst3_COUT));
assign O = {FullAdder_inst3_O,FullAdder_inst2_O,FullAdder_inst1_O,FullAdder_inst0_O};
endmodule

module Arbiter4 (input [3:0] I, output [3:0] O);
wire [3:0] Add4_inst0_O;
wire  SB_LUT4_inst0_O;
wire  SB_LUT4_inst1_O;
wire  SB_LUT4_inst2_O;
wire  SB_LUT4_inst3_O;
Add4 Add4_inst0 (.I0(I), .I1(4'd15'), .O(Add4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst0 (.I0(I[0]), .I1(Add4_inst0_O[0]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst1 (.I0(I[1]), .I1(Add4_inst0_O[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst2 (.I0(I[2]), .I1(Add4_inst0_O[2]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) SB_LUT4_inst3 (.I0(I[3]), .I1(Add4_inst0_O[3]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst3_O));
assign O = {SB_LUT4_inst3_O,SB_LUT4_inst2_O,SB_LUT4_inst1_O,SB_LUT4_inst0_O};
endmodule

