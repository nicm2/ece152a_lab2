// 2-bit Adder module
// Inputs:  A[1:0], B[1:0], Cin
// Outputs: S[1:0], Cout
// Implemented from truth table with minimized SOP expressions
// Truth table has 2^5 = 32 rows (A1,A0,B1,B0,Cin)

module twoBitAdder(A, B, Cin, S, Cout);
    input  wire [1:0] A, B;
    input  wire Cin;
    output wire [1:0] S;
    output wire Cout;

    // Intermediate wires
    wire A0, A1, B0, B1;
    assign A0 = A[0]; assign A1 = A[1];
    assign B0 = B[0]; assign B1 = B[1];

    // =====================
    // S[0] — same as full adder sum for bit 0
    // S0 = A0^B0^Cin (implemented with AND/OR/NOT)
    // Minterms where S0=1:
    // A0'B0'Cin + A0'B0Cin' + A0B0'Cin' + A0B0Cin
    // =====================
    wire A0n, B0n, Cinn;
    not n0(A0n,  A0);
    not n1(B0n,  B0);
    not n2(Cinn, Cin);

    wire s0t0, s0t1, s0t2, s0t3;
    and g_s0t0(s0t0, A0n, B0n, Cin);    // A0'B0'Cin
    and g_s0t1(s0t1, A0n, B0,  Cinn);   // A0'B0Cin'
    and g_s0t2(s0t2, A0,  B0n, Cinn);   // A0B0'Cin'
    and g_s0t3(s0t3, A0,  B0,  Cin);    // A0B0Cin
    or  g_s0  (S[0], s0t0, s0t1, s0t2, s0t3);

    // Internal carry between bit 0 and bit 1
    // C1 = A0B0 + A0Cin + B0Cin
    wire c1_t0, c1_t1, c1_t2, C1;
    and g_c1t0(c1_t0, A0, B0);
    and g_c1t1(c1_t1, A0, Cin);
    and g_c1t2(c1_t2, B0, Cin);
    or  g_c1  (C1, c1_t0, c1_t1, c1_t2);

    // =====================
    // S[1] — full adder sum for bit 1, using C1 as carry-in
    // S1 = A1^B1^C1
    // Minterms where S1=1:
    // A1'B1'C1 + A1'B1C1' + A1B1'C1' + A1B1C1
    // =====================
    wire A1n, B1n, C1n;
    not n3(A1n, A1);
    not n4(B1n, B1);
    not n5(C1n, C1);

    wire s1t0, s1t1, s1t2, s1t3;
    and g_s1t0(s1t0, A1n, B1n, C1);    // A1'B1'C1
    and g_s1t1(s1t1, A1n, B1,  C1n);   // A1'B1C1'
    and g_s1t2(s1t2, A1,  B1n, C1n);   // A1B1'C1'
    and g_s1t3(s1t3, A1,  B1,  C1);    // A1B1C1
    or  g_s1  (S[1], s1t0, s1t1, s1t2, s1t3);

    // =====================
    // Cout — carry out of bit 1
    // Cout = A1B1 + A1C1 + B1C1
    // =====================
    wire co_t0, co_t1, co_t2;
    and g_cot0(co_t0, A1, B1);
    and g_cot1(co_t1, A1, C1);
    and g_cot2(co_t2, B1, C1);
    or  g_cout(Cout, co_t0, co_t1, co_t2);

endmodule
