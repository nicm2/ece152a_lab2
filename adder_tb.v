module adder_tb;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] S;
    wire       Cout, Overflow;

    fourBitAdder_FourByOne f0(
        .A(A), .B(B), .Cin(Cin),
        .S(S), .Cout(Cout), .Overflow(Overflow)
    );

    initial begin
        $monitor("A=%b B=%b Cin=%b | S=%b Cout=%b Overflow=%b | (%0d+%0d+%0d=%0d)",
                  A, B, Cin, S, Cout, Overflow, A, B, Cin, {Cout,S});

        A=4'b0000; B=4'b0000; Cin=0; #10;  // 0+0 = 0
        A=4'b0001; B=4'b0001; Cin=0; #10;  // 1+1 = 2
        A=4'b0011; B=4'b0101; Cin=0; #10;  // 3+5 = 8
        A=4'b0111; B=4'b0001; Cin=0; #10;  // 7+1 = 8

        A=4'b0000; B=4'b0000; Cin=1; #10;  // 0+0+1 = 1
        A=4'b0001; B=4'b0001; Cin=1; #10;  // 1+1+1 = 3

        A=4'b1111; B=4'b0001; Cin=0; #10;  // 15+1 = 16 (overflow)
        A=4'b1000; B=4'b1000; Cin=0; #10;  // 8+8  = 16 (overflow)

        A=4'b1111; B=4'b1111; Cin=0; #10;  // 15+15 = 30 (overflow)
        A=4'b1111; B=4'b1111; Cin=1; #10;  // 15+15+1 = 31 (overflow)

        A=4'b0111; B=4'b1000; Cin=0; #10;  // 7+8 = 15
        A=4'b1110; B=4'b0001; Cin=0; #10;  // 14+1 = 15 

        $finish;
    end
endmodule
