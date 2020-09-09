module hw (a,b,c,o);

input [4:0] a;
input [4:0] b;
output [8:0] c;
output o ;

wire cin; // o:overflow

assign cin = (a[4]&b[3]&b[4]) | (a[3]&a[4]&b[4]) ;
// Sign part.
assign c[0] = a[0] ^ b[0] ;  
// Exponential part.                                                                                                                                         
assign c[1] = (~a[1]&b[1]&cin) | (b[1]&b[2]&~cin) | (a[2]&b[1]&~b[2]) | (a[1]&~a[2]&cin) | (a[1]&~a[2]&b[2]) | (a[1]&~a[2]&b[1]) | (a[1]&a[2]&~b[1]) | (~a[1]&a[2]&b[2]&cin);
assign c[2] = (~a[1]&~a[2]&~b[1]&cin) | (~a[1]&~b[1]&b[2]&~cin) | (~a[1]&a[2]&~b[1]&~b[2]) | (a[1]&~a[2]&b[1]&cin) | (a[1]&b[1]&b[2]&~cin) | (a[1]&a[2]&b[1]&~b[2]) | (~a[1]&~a[2]&b[1]&~b[2]&~cin) | (~a[1]&a[2]&b[1]&b[2]&cin) | (a[1]&~a[2]&~b[1]&~b[2]&~cin) | (a[1]&a[2]&~b[1]&b[2]&cin);
assign c[3] = (~a[2]&~b[2]&~cin) | (~a[2]&b[2]&cin ) | (a[2]&~b[2]&cin) | (a[2]&b[2]& ~cin) ;
assign o = ( a[1]&a[2]&b[1]&b[2]&cin ) ; // Overflow.
// Mantissa part.
assign c[8] = (a[4]&b[3]&b[4]) | (a[3]&a[4]&b[4]);
assign c[7] = (~a[3]&a[4]&b[4]) | (a[4]&~b[3]&b[4]) | (a[3]&~a[4]&b[3]&b[4]) | (a[3]&a[4]&b[3]&~b[4]);
assign c[6] = (~a[3]&a[4]&b[3]&~b[4]) | (a[3]&~a[4]&~b[3]&b[4]) | (a[3]&~a[4]&b[3]&~b[4]);
assign c[5] = (~a[4]&b[4]) | (a[4]&~b[4]) | (a[3]&b[3]&b[4]) ;
assign c[4] = (~a[3]&~a[4]&b[3]) | (~a[3]&b[3]&~b[4]) | (a[3]&~a[4]&~b[3]) | (a[3]&~b[3]&~b[4]) | (~a[3]&a[4]&~b[3]&b[4]) ;

endmodule 