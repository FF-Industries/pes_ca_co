/* Generated by Yosys 0.34+14 (git sha1 417871e83, clang 14.0.0-1ubuntu1.1 -fPIC -Os) */

(* src = "pes_se_M_full_adder.v:1.1-24.10" *)
module full_adder(a, b, cin, sum, cout);
  (* src = "pes_se_M_full_adder.v:2.11-2.12" *)
  input a;
  wire a;
  (* src = "pes_se_M_full_adder.v:2.14-2.15" *)
  input b;
  wire b;
  (* src = "pes_se_M_full_adder.v:6.12-6.18" *)
  wire carry1;
  (* src = "pes_se_M_full_adder.v:6.20-6.26" *)
  wire carry2;
  (* src = "pes_se_M_full_adder.v:2.17-2.20" *)
  input cin;
  wire cin;
  (* src = "pes_se_M_full_adder.v:3.17-3.21" *)
  output cout;
  wire cout;
  (* src = "pes_se_M_full_adder.v:3.12-3.15" *)
  output sum;
  wire sum;
  (* src = "pes_se_M_full_adder.v:6.6-6.10" *)
  wire sum1;
  assign cout = carry2 | carry1;
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M_full_adder.v:8.12-13.2" *)
  half_adder HA1 (
    .a(a),
    .b(b),
    .carry(carry1),
    .sum(sum1)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M_full_adder.v:15.12-20.2" *)
  half_adder HA2 (
    .a(sum1),
    .b(cin),
    .carry(carry2),
    .sum(sum)
  );
endmodule

(* src = "pes_se_M_half_adder.v:1.1-9.10" *)
module half_adder(a, b, sum, carry);
  (* src = "pes_se_M_half_adder.v:2.11-2.12" *)
  input a;
  wire a;
  (* src = "pes_se_M_half_adder.v:2.13-2.14" *)
  input b;
  wire b;
  (* src = "pes_se_M_half_adder.v:3.16-3.21" *)
  output carry;
  wire carry;
  (* src = "pes_se_M_half_adder.v:3.12-3.15" *)
  output sum;
  wire sum;
  assign sum = b ^ a;
  assign carry = b & a;
endmodule

(* top =  1  *)
(* src = "pes_se_M.v:1.1-25.10" *)
module pes_se_M(A, B, product);
  (* src = "pes_se_M.v:12.19-12.28" *)
  wire _00_;
  (* src = "pes_se_M.v:12.34-12.43" *)
  wire _01_;
  (* src = "pes_se_M.v:13.19-13.28" *)
  wire _02_;
  (* src = "pes_se_M.v:13.34-13.43" *)
  wire _03_;
  (* src = "pes_se_M.v:14.34-14.43" *)
  wire _04_;
  (* src = "pes_se_M.v:14.19-14.28" *)
  wire _05_;
  (* src = "pes_se_M.v:15.19-15.28" *)
  wire _06_;
  (* src = "pes_se_M.v:16.19-16.28" *)
  wire _07_;
  (* src = "pes_se_M.v:17.19-17.28" *)
  wire _08_;
  (* src = "pes_se_M.v:18.19-18.28" *)
  wire _09_;
  (* src = "pes_se_M.v:19.19-19.28" *)
  wire _10_;
  (* src = "pes_se_M.v:20.19-20.28" *)
  wire _11_;
  (* src = "pes_se_M.v:21.19-21.28" *)
  wire _12_;
  (* src = "pes_se_M.v:22.19-22.28" *)
  wire _13_;
  (* src = "pes_se_M.v:23.19-23.28" *)
  wire _14_;
  (* src = "pes_se_M.v:2.17-2.18" *)
  input [3:0] A;
  wire [3:0] A;
  (* src = "pes_se_M.v:3.17-3.18" *)
  input [3:0] B;
  wire [3:0] B;
  (* src = "pes_se_M.v:7.6-7.8" *)
  wire c0;
  (* src = "pes_se_M.v:7.10-7.12" *)
  wire c1;
  (* src = "pes_se_M.v:7.46-7.49" *)
  wire c10;
  (* src = "pes_se_M.v:7.14-7.16" *)
  wire c2;
  (* src = "pes_se_M.v:7.18-7.20" *)
  wire c3;
  (* src = "pes_se_M.v:7.22-7.24" *)
  wire c4;
  (* src = "pes_se_M.v:7.26-7.28" *)
  wire c5;
  (* src = "pes_se_M.v:7.30-7.32" *)
  wire c6;
  (* src = "pes_se_M.v:7.34-7.36" *)
  wire c7;
  (* src = "pes_se_M.v:7.38-7.40" *)
  wire c8;
  (* src = "pes_se_M.v:7.42-7.44" *)
  wire c9;
  (* src = "pes_se_M.v:4.18-4.25" *)
  output [7:0] product;
  wire [7:0] product;
  (* src = "pes_se_M.v:8.6-8.12" *)
  wire sum_u1;
  (* src = "pes_se_M.v:8.14-8.20" *)
  wire sum_u2;
  (* src = "pes_se_M.v:8.22-8.28" *)
  wire sum_u3;
  (* src = "pes_se_M.v:8.30-8.36" *)
  wire sum_u5;
  (* src = "pes_se_M.v:8.38-8.44" *)
  wire sum_u6;
  (* src = "pes_se_M.v:8.46-8.52" *)
  wire sum_u7;
  assign _01_ = B[0] & A[1];
  assign _02_ = B[1] & A[1];
  assign _03_ = A[2] & B[0];
  assign _05_ = A[2] & B[1];
  assign _04_ = A[3] & B[0];
  assign _06_ = A[3] & B[1];
  assign _07_ = B[2] & A[0];
  assign _08_ = B[2] & A[1];
  assign _09_ = B[2] & A[2];
  assign _10_ = B[2] & A[3];
  assign _11_ = B[3] & A[0];
  assign _12_ = B[3] & A[1];
  assign _13_ = B[3] & A[2];
  assign _14_ = B[3] & A[3];
  assign product[0] = A[0] & B[0];
  assign _00_ = A[0] & B[1];
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:12.12-12.75" *)
  half_adder u0 (
    .a(_00_),
    .b(_01_),
    .carry(c0),
    .sum(product[1])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:13.12-13.80" *)
  full_adder u1 (
    .a(_02_),
    .b(_03_),
    .cin(c0),
    .cout(c1),
    .sum(sum_u1)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:22.12-22.82" *)
  full_adder u10 (
    .a(_13_),
    .b(sum_u7),
    .cin(c9),
    .cout(c10),
    .sum(product[5])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:23.12-23.86" *)
  full_adder u11 (
    .a(_14_),
    .b(c7),
    .cin(c10),
    .cout(product[7]),
    .sum(product[6])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:14.12-14.80" *)
  full_adder u2 (
    .a(_05_),
    .b(_04_),
    .cin(c1),
    .cout(c2),
    .sum(sum_u2)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:15.12-15.64" *)
  half_adder u3 (
    .a(_06_),
    .b(c2),
    .carry(c3),
    .sum(sum_u3)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:16.12-16.72" *)
  half_adder u4 (
    .a(_07_),
    .b(sum_u1),
    .carry(c4),
    .sum(product[2])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:17.12-17.77" *)
  full_adder u5 (
    .a(_08_),
    .b(sum_u2),
    .cin(c4),
    .cout(c5),
    .sum(sum_u5)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:18.12-18.77" *)
  full_adder u6 (
    .a(_09_),
    .b(sum_u3),
    .cin(c5),
    .cout(c6),
    .sum(sum_u6)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:19.12-19.73" *)
  full_adder u7 (
    .a(_10_),
    .b(c3),
    .cin(c6),
    .cout(c7),
    .sum(sum_u7)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:20.12-20.72" *)
  half_adder u8 (
    .a(_11_),
    .b(sum_u5),
    .carry(c8),
    .sum(product[3])
  );
  (* module_not_derived = 32'd1 *)
  (* src = "pes_se_M.v:21.12-21.81" *)
  full_adder u9 (
    .a(_12_),
    .b(sum_u6),
    .cin(c8),
    .cout(c9),
    .sum(product[4])
  );
endmodule
