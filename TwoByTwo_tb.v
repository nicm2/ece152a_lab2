module TwoByTwo_tb;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] S;
    wire       Cout, Overflow;

    fourBitAdder_TwoByTwo f0(
        .A(A), .B(B), .Cin(Cin),
        .S(S), .Cout(Cout), .Overflow(Overflow)
    );

    initial begin
        $monitor("A=%b B=%b Cin=%b | S=%b Cout=%b Overflow=%b | (%0d+%0d+%0d=%0d)",
                  A, B, Cin, S, Cout, Overflow, A, B, Cin, {Cout,S});

        A=4'b0000; B=4'b0000; Cin=0; #10;
        A=4'b0001; B=4'b0001; Cin=0; #10;
        A=4'b0011; B=4'b0101; Cin=0; #10;
        A=4'b0111; B=4'b0001; Cin=0; #10;

        A=4'b0000; B=4'b0000; Cin=1; #10;
        A=4'b0001; B=4'b0001; Cin=1; #10;

        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1000; B=4'b1000; Cin=0; #10;

        A=4'b1111; B=4'b1111; Cin=0; #10;
        A=4'b1111; B=4'b1111; Cin=1; #10;

        A=4'b0111; B=4'b1000; Cin=0; #10;
        A=4'b1110; B=4'b0001; Cin=0; #10;

        $finish;
    end
endmodule
