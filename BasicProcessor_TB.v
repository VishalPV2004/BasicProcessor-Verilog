
module pipe_test;
  
  wire [15:0] Z;
  reg [9:0] rs1, rs2, rd;
  reg [3:0] func;
  reg [9:0] addr;
  reg clk1, clk2;
  
  integer k;
  
  pipe_ex2 gg(Z, rs1, rs2, rd, func, addr, clk1, clk2);
  
  initial
    begin
      clk1 = 0; clk2 = 0;
      repeat(20)
        begin
      #5 clk1 = 1; #5 clk1 = 0;
      #5 clk2 = 1; #5 clk2 = 0;
        end

    end

  initial
    begin
      for (k = 0; k < 400; k = k + 1)
        gg.regbank[k] = k;
    end

  initial
    begin
       #5 rs1 = 3; rs2 = 3; rd = 10; func = 0;addr = 125;
       #5 rs1 = 4; rs2 = 4; rd = 12; func = 1;addr = 126;
       #5 rs1 = 5; rs2 = 5; rd = 14; func = 2;addr = 127;
       #5 rs1 = 6; rs2 = 6; rd = 16; func = 3;addr = 128;
       #5 rs1 = 7; rs2 = 7; rd = 18; func = 4;addr = 129;
       #5 rs1 = 8; rs2 = 8; rd = 20; func = 5;addr = 130;
       #5 rs1 = 9; rs2 = 9; rd = 22; func = 6;addr = 131;
       #5 rs1 = 10; rs2 = 10; rd = 24; func = 7;addr = 132;
       #5 rs1 = 11; rs2 = 11; rd = 26; func = 8;addr = 133;
       #5 rs1 = 12; rs2 = 12; rd = 28; func = 9;addr = 134;
      
      for(k=125;k<=134;k=k+1)
        begin
          $display("Output : %d, Address : %d",gg.mem[k],k);
        end
    end

  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;

      
      #500 $finish;
    end

endmodule

      