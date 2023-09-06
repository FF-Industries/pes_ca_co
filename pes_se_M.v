module pes_se_M(
    input [3:0] A,
    input [3:0] B,
    output [7:0] product
);

wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;
wire sum_u1, sum_u2, sum_u3, sum_u5, sum_u6, sum_u7;

assign product[0] = A[0] & B[0];

half_adder u0 (.a(A[0]&B[1]), .b(A[1]&B[0]), .sum(product[1]), .carry(c0));
full_adder u1 (.a(A[1]&B[1]), .b(A[2]&B[0]), .cin(c0), .sum(sum_u1), .cout(c1));
full_adder u2 (.a(A[2]&B[1]), .b(A[3]&B[0]), .cin(c1), .sum(sum_u2), .cout(c2));
half_adder u3 (.a(A[3]&B[1]), .b(c2), .sum(sum_u3), .carry(c3));
half_adder u4 (.a(A[0]&B[2]), .b(sum_u1), .sum(product[2]), .carry(c4));
full_adder u5 (.a(A[1]&B[2]), .b(sum_u2), .cin(c4), .sum(sum_u5), .cout(c5));
full_adder u6 (.a(A[2]&B[2]), .b(sum_u3), .cin(c5), .sum(sum_u6), .cout(c6));
full_adder u7 (.a(A[3]&B[2]), .b(c3), .cin(c6), .sum(sum_u7), .cout(c7));
half_adder u8 (.a(A[0]&B[3]), .b(sum_u5), .sum(product[3]), .carry(c8));
full_adder u9 (.a(A[1]&B[3]), .b(sum_u6), .cin(c8), .sum(product[4]), .cout(c9));
full_adder u10(.a(A[2]&B[3]), .b(sum_u7), .cin(c9), .sum(product[5]), .cout(c10));
full_adder u11(.a(A[3]&B[3]), .b(c7), .cin(c10), .sum(product[6]), .cout(product[7]));

endmodule











