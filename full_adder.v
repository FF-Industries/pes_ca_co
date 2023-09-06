module full_adder (
    input a, b, cin,          // Inputs: a, b and carry-in
    output sum, cout          // Outputs: sum and carry-out
);

wire sum1, carry1, carry2;

half_adder HA1 (
    .a(a),
    .b(b),
    .sum(sum1),
    .carry(carry1)
);

half_adder HA2 (
    .a(sum1),
    .b(cin),
    .sum(sum),
    .carry(carry2)
);

assign cout = carry1 | carry2;

endmodule
