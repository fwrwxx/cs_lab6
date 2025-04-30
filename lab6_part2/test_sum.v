module test_sum;
  reg [6:0] Ain_r, Bin_r;
  reg Ci_r;
  wire [6:0] Ain, Bin;
  wire Ci;
  wire [6:0] res_my, res_ref;
  wire cm, cr;

  assign Ain = Ain_r;
  assign Bin = Bin_r;
  assign Ci = Ci_r;

  my_sum  my_block  (Ain, Bin, Ci, res_my, cm);
  ref_sum ref_block (Ain, Bin, Ci, res_ref, cr);

  initial begin
    $display("\tTime\tAin\tBin\tCi\tmy_sum\tcm\tref_sum\tcr");
    $monitor("%t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, Ain, Bin, Ci, res_my, cm, res_ref, cr);
    #800 $finish;
  end

  initial begin
    Ain_r = 7'b0000001;  Bin_r = 7'b0000010;  Ci_r = 1'b0;
    #100 Ain_r = 7'b0000101;
    #100 Bin_r = 7'b0001010;
    #100 Ain_r = 7'b0010000;
    #100 Bin_r = 7'b0100000;
    #100 Ain_r = 7'b0111111;
    #100 Bin_r = 7'b0111111;
    #100 Ci_r  = 1'b1;
  end
endmodule