module mux_2x1(out, a, s);

input [1:0] a;
input s;
output out;

wire s0n; //s0 not
wire w1a,w2b;

not n1(s0n,s);

and and1(w1a,s0n,a[0]);
and and2(w2b,s,a[1]);

or or1(out,w1a,w2b);

endmodule