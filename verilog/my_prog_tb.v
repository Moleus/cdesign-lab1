`timescale 1ns / 1ps

module my_prog_tb;
reg [3:0] x_0;
reg [3:0] x_1;
wire res_0, res_1, res_2;
my_prog comparator(
    .x0(x_0),
    .x1(x_1),
    .res0(res_0),
    .res1(res_1),
    .res2(res_2)
);

integer i, j;

reg expected_res0, expected_res1, expected_res2;
initial begin

    for (i=0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            x_0 = i;
            x_1 = j;

            expected_res0 = (i == j) ? 1'b1 : 1'b0;
            expected_res1 = (i > j) ? 1'b1 : 1'b0;
            expected_res2 = (i < j) ? 1'b1 : 1'b0;
            #1;

            // ��������� ����������
            if ((res_0 !== expected_res0) || (res_1 !== expected_res1) || (res_2 !== expected_res2)) begin
            $display("ERROR: Test failed! x_0 = %b, x_1 = %b, res_0 = %b (expected %b), res_1 = %b (expected %b), res_2 = %b (expected %b)", x_0, x_1, res_0, expected_res0, res_1, expected_res1, res_2, expected_res2);
                end else begin
            $display("Test passed! x_0 = %b, x_1 = %b, res_0 = %b, res_1 = %b, res_2 = %b", x_0, x_1, res_0, res_1, res_2);
            end
        end
    end
    #1 $stop;
end

endmodule
