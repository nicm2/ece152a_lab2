module fourBitAdder_TwoByTwo(A, B, Cin, S, Cout, Overflow);
    input  wire [3:0] A, B;
    input  wire Cin;
    output wire [3:0] S;
    output wire Cout;
    output wire Overflow;

    wire carry_mid; 

    twoBitAdder tba_low(
        .A(A[1:0]), .B(B[1:0]), .Cin(Cin),
        .S(S[1:0]), .Cout(carry_mid)
    );

    twoBitAdder tba_high(
        .A(A[3:2]), .B(B[3:2]), .Cin(carry_mid),
        .S(S[3:2]), .Cout(Cout)
    );

    assign Overflow = c3 ^ Cout;
  
endmodule
