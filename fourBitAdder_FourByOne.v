module fourBitAdder_FourByOne(A, B, Cin, S, Cout, Overflow);
    input  wire [3:0] A, B;
    input  wire Cin;
    output wire [3:0] S;
    output wire Cout;
    output wire Overflow;

    wire c1, c2, c3;

    fullAdder fa0(.a(A[0]), .b(B[0]), .cin(Cin), .s(S[0]), .cout(c1));
    fullAdder fa1(.a(A[1]), .b(B[1]), .cin(c1),  .s(S[1]), .cout(c2));
    fullAdder fa2(.a(A[2]), .b(B[2]), .cin(c2),  .s(S[2]), .cout(c3));
    fullAdder fa3(.a(A[3]), .b(B[3]), .cin(c3),  .s(S[3]), .cout(Cout));

    assign Overflow = c3 ^ Cout; 
  
endmodule
