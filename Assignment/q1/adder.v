module cla_4bit(A,B,Cin,Sum,Cout);

input [3:0] A,B;
input Cin;
output [3:0] Sum;
output Cout;

wire [3:0] P,G;
wire C1,C2,C3;

/* Propagate and Generate */
xor (P[0],A[0],B[0]);
xor (P[1],A[1],B[1]);
xor (P[2],A[2],B[2]);
xor (P[3],A[3],B[3]);

and (G[0],A[0],B[0]);
and (G[1],A[1],B[1]);
and (G[2],A[2],B[2]);
and (G[3],A[3],B[3]);

/* Carry generation */
wire w1,w2,w3,w4,w5,w6,w7;

and (w1,P[0],Cin);
or  (C1,G[0],w1);

and (w2,P[1],G[0]);
and (w3,P[1],P[0],Cin);
or  (C2,G[1],w2,w3);

and (w4,P[2],G[1]);
and (w5,P[2],P[1],G[0]);
and (w6,P[2],P[1],P[0],Cin);
or  (C3,G[2],w4,w5,w6);

and (w7,P[3],G[2]);
wire w8,w9,w10;

and (w8,P[3],P[2],G[1]);
and (w9,P[3],P[2],P[1],G[0]);
and (w10,P[3],P[2],P[1],P[0],Cin);

or (Cout,G[3],w7,w8,w9,w10);

/* Sum generation */
xor (Sum[0],P[0],Cin);
xor (Sum[1],P[1],C1);
xor (Sum[2],P[2],C2);
xor (Sum[3],P[3],C3);

endmodule