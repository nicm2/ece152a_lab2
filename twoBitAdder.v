module twoBitAdder(A, B, Cin, S, Cout);
    input  wire [1:0] A, B;
    input  wire Cin;
    output wire [1:0] S;
    output wire Cout;

    wire carry_mid;

    fullAdder fa0(.a(A[0]), .b(B[0]), .cin(Cin),       .s(S[0]), .cout(carry_mid));
    fullAdder fa1(.a(A[1]), .b(B[1]), .cin(carry_mid), .s(S[1]), .cout(Cout));

endmodule
