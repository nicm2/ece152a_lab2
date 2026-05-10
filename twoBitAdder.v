module fullAdder(a, b, cin, s, cout);
    input wire a, b, cin;
    output wire s, cout;

    wire an, bn, cinn;
    wire t0, t1, t2, t3;

    not g0(an,   a);
    not g1(bn,   b);
    not g2(cinn, cin);

    and g3(t0, an,  bn,  cin);   
    and g4(t1, an,  b,   cinn);  
    and g5(t2, a,   bn,  cinn);  
    and g6(t3, a,   b,   cin); 

    or  g7(s, t0, t1, t2, t3);

    wire c0, c1, c2;

    and g8(c0, a, b);
    and g9(c1, a, cin);
    and g10(c2, b, cin);

    or  g11(cout, c0, c1, c2);

endmodule
