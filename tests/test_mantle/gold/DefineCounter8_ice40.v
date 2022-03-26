module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  SB_LUT4_inst0_O;
wire  SB_CARRY_inst0_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) SB_LUT4_inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(SB_LUT4_inst0_O));
SB_CARRY SB_CARRY_inst0 (.I0(I0), .I1(I1), .CI(CIN), .CO(SB_CARRY_inst0_CO));
assign O = SB_LUT4_inst0_O;
assign COUT = SB_CARRY_inst0_CO;
endmodule

module Add8_COUT (input [7:0] I0, input [7:0] I1, output [7:0] O, output  COUT);
wire  FullAdder_inst0_O;
wire  FullAdder_inst0_COUT;
wire  FullAdder_inst1_O;
wire  FullAdder_inst1_COUT;
wire  FullAdder_inst2_O;
wire  FullAdder_inst2_COUT;
wire  FullAdder_inst3_O;
wire  FullAdder_inst3_COUT;
wire  FullAdder_inst4_O;
wire  FullAdder_inst4_COUT;
wire  FullAdder_inst5_O;
wire  FullAdder_inst5_COUT;
wire  FullAdder_inst6_O;
wire  FullAdder_inst6_COUT;
wire  FullAdder_inst7_O;
wire  FullAdder_inst7_COUT;
FullAdder FullAdder_inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(FullAdder_inst0_O), .COUT(FullAdder_inst0_COUT));
FullAdder FullAdder_inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(FullAdder_inst0_COUT), .O(FullAdder_inst1_O), .COUT(FullAdder_inst1_COUT));
FullAdder FullAdder_inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(FullAdder_inst1_COUT), .O(FullAdder_inst2_O), .COUT(FullAdder_inst2_COUT));
FullAdder FullAdder_inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(FullAdder_inst2_COUT), .O(FullAdder_inst3_O), .COUT(FullAdder_inst3_COUT));
FullAdder FullAdder_inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(FullAdder_inst3_COUT), .O(FullAdder_inst4_O), .COUT(FullAdder_inst4_COUT));
FullAdder FullAdder_inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(FullAdder_inst4_COUT), .O(FullAdder_inst5_O), .COUT(FullAdder_inst5_COUT));
FullAdder FullAdder_inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(FullAdder_inst5_COUT), .O(FullAdder_inst6_O), .COUT(FullAdder_inst6_COUT));
FullAdder FullAdder_inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(FullAdder_inst6_COUT), .O(FullAdder_inst7_O), .COUT(FullAdder_inst7_COUT));
assign O = {FullAdder_inst7_O,FullAdder_inst6_O,FullAdder_inst5_O,FullAdder_inst4_O,FullAdder_inst3_O,FullAdder_inst2_O,FullAdder_inst1_O,FullAdder_inst0_O};
assign COUT = FullAdder_inst7_COUT;
endmodule

module Register8 (input [7:0] I, output [7:0] O, input  CLK);
wire  SB_DFF_inst0_Q;
wire  SB_DFF_inst1_Q;
wire  SB_DFF_inst2_Q;
wire  SB_DFF_inst3_Q;
wire  SB_DFF_inst4_Q;
wire  SB_DFF_inst5_Q;
wire  SB_DFF_inst6_Q;
wire  SB_DFF_inst7_Q;
SB_DFF SB_DFF_inst0 (.C(CLK), .D(I[0]), .Q(SB_DFF_inst0_Q));
SB_DFF SB_DFF_inst1 (.C(CLK), .D(I[1]), .Q(SB_DFF_inst1_Q));
SB_DFF SB_DFF_inst2 (.C(CLK), .D(I[2]), .Q(SB_DFF_inst2_Q));
SB_DFF SB_DFF_inst3 (.C(CLK), .D(I[3]), .Q(SB_DFF_inst3_Q));
SB_DFF SB_DFF_inst4 (.C(CLK), .D(I[4]), .Q(SB_DFF_inst4_Q));
SB_DFF SB_DFF_inst5 (.C(CLK), .D(I[5]), .Q(SB_DFF_inst5_Q));
SB_DFF SB_DFF_inst6 (.C(CLK), .D(I[6]), .Q(SB_DFF_inst6_Q));
SB_DFF SB_DFF_inst7 (.C(CLK), .D(I[7]), .Q(SB_DFF_inst7_Q));
assign O = {SB_DFF_inst7_Q,SB_DFF_inst6_Q,SB_DFF_inst5_Q,SB_DFF_inst4_Q,SB_DFF_inst3_Q,SB_DFF_inst2_Q,SB_DFF_inst1_Q,SB_DFF_inst0_Q};
endmodule

module Counter8_COUT (output [7:0] O, output  COUT, input  CLK);
wire [7:0] Add8_COUT_inst0_O;
wire  Add8_COUT_inst0_COUT;
wire [7:0] Register8_inst0_O;
Add8_COUT Add8_COUT_inst0 (.I0(Register8_inst0_O), .I1(8'd1'), .O(Add8_COUT_inst0_O), .COUT(Add8_COUT_inst0_COUT));
Register8 Register8_inst0 (.I(Add8_COUT_inst0_O), .O(Register8_inst0_O), .CLK(CLK));
assign O = Register8_inst0_O;
assign COUT = Add8_COUT_inst0_COUT;
endmodule

