module Or2 (input [1:0] I, output  O);
wire  SB_LUT4_inst0_O;
SB_LUT4 #(.LUT_INIT(16'hEEEE)) SB_LUT4_inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(SB_LUT4_inst0_O));
assign O = SB_LUT4_inst0_O;
endmodule

module Or2x4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  Or2_inst0_O;
wire  Or2_inst1_O;
wire  Or2_inst2_O;
wire  Or2_inst3_O;
Or2 Or2_inst0 (.I({I1[0],I0[0]}), .O(Or2_inst0_O));
Or2 Or2_inst1 (.I({I1[1],I0[1]}), .O(Or2_inst1_O));
Or2 Or2_inst2 (.I({I1[2],I0[2]}), .O(Or2_inst2_O));
Or2 Or2_inst3 (.I({I1[3],I0[3]}), .O(Or2_inst3_O));
assign O = {Or2_inst3_O,Or2_inst2_O,Or2_inst1_O,Or2_inst0_O};
endmodule

