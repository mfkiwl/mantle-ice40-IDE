module test_romb (output [7:0] O, input  CLK);
wire [31:0] inst0_DOA;
wire [3:0] inst0_DOPA;
wire [31:0] inst0_DOB;
wire [3:0] inst0_DOPB;
RAMB16BWER #(.DATA_WIDTH_A(9),
.DATA_WIDTH_B(9),
.INIT_00(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_01(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_02(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_03(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_04(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_05(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_06(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_07(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_08(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_09(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_0A(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_0B(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_0C(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_0D(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_0E(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_0F(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_10(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_11(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_12(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_13(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_14(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_15(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_16(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_17(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_18(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_19(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_1A(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_1B(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_1C(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_1D(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_1E(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_1F(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_20(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_21(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_22(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_23(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_24(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_25(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_26(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_27(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_28(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_29(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_2A(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_2B(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_2C(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_2D(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_2E(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_2F(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_30(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_31(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_32(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_33(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_34(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_35(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_36(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_37(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_38(256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100),
.INIT_39(256'h3F3E3D3C3B3A393837363534333231302F2E2D2C2B2A29282726252423222120),
.INIT_3A(256'h5F5E5D5C5B5A595857565554535251504F4E4D4C4B4A49484746454443424140),
.INIT_3B(256'h7F7E7D7C7B7A797877767574737271706F6E6D6C6B6A69686766656463626160),
.INIT_3C(256'h9F9E9D9C9B9A999897969594939291908F8E8D8C8B8A89888786858483828180),
.INIT_3D(256'hBFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0AFAEADACABAAA9A8A7A6A5A4A3A2A1A0),
.INIT_3E(256'hDFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0),
.INIT_3F(256'hFFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0),
.INIT_A(8'h00),
.INIT_B(8'h00),
.SRVAL_A(8'h00),
.SRVAL_B(8'h00),
.WRITE_MODE_A("WRITE_FIRST"),
.WRITE_MODE_B("WRITE_FIRST")) inst0 (.DIA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .DIPA({1'b0,1'b0,1'b0,1'b0}), .DOA(inst0_DOA), .DOPA(inst0_DOPA), .ADDRA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}), .CLKA(CLK), .ENA(1'b1), .WEA({1'b0,1'b0,1'b0,1'b0}), .RSTA(1'b0), .REGCEA(1'b0), .DOB(inst0_DOB), .DOPB(inst0_DOPB), .CLKB(1'b0), .ENB(1'b0), .WEB({1'b0,1'b0,1'b0,1'b0}), .RSTB(1'b0), .REGCEB(1'b0));
assign O = {inst0_DOA[7],inst0_DOA[6],inst0_DOA[5],inst0_DOA[4],inst0_DOA[3],inst0_DOA[2],inst0_DOA[1],inst0_DOA[0]};
endmodule

