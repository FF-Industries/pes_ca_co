module tb_pes_se_M;

reg [3:0] A;
reg [3:0] B;
wire [7:0] product;

pes_se_M  uut(
    .A(A),
    .B(B),
    .product(product)
);

initial begin

    // Specify the VCD file to dump the waveform
    $dumpfile("tb_pes_se_M.vcd");
    // Dump all variables in this testbench module
    $dumpvars(0, tb_pes_se_M);

    A = 4'b1000;   // This is binary for decimal 8
    B = 4'b1000;   // This is binary for decimal 8
    #100;

    A = 4'b0001;   // This is binary for decimal 1
    B = 4'b0001;   // This is binary for decimal 1
    #100;

    A = 4'b0010;   // This is binary for decimal 2
    B = 4'b0010;   // This is binary for decimal 2
    #100;

    A = 4'b0000;   // This is binary for decimal 0
    B = 4'b0000;   // This is binary for decimal 0
    #100;

    $finish;  // End the simulation
end

endmodule
