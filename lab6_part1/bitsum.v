module bitsum (A, B, S, Cin, Cout);
  input A, B, Cin;
  output S, Cout;

  wire A, B, S, Res;
  wire c1, c2, Cin, Cout;

  xor(Res, A, B);
  and(c1, A, B);
  xor(S, Cin, Res);
  and(c2, Cin, Res);
  or(Cout, c1, c2);

endmodule