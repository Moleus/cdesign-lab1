`timescale 1ns / 1ps

module my_eq_tb;
reg x_0,x_1;
wire res;
my_eq equals(
    .x0(x_0),
    .x1(x_1),
    .res(res)
);
integer i;
reg [1:0] test_val;
reg expected_res;
initial begin
    for(i=0;i<4;i=i+1) begin
        test_val=i;
        x_0=test_val[0];
        x_1=test_val[1];

        expected_res= (x_0 & x_1) | (~x_0 & ~x_1);

        #10

          if (res == expected_res) begin
           $display ("equal:Correct!!! x_0=%b x_1=%b res=%b", x_0,x_1,res);
          end else begin
            $display ("equal:Wrong!!! x_0=%b x_1=%b res=%b, expected=&b", x_0,x_1,res, expected_res);
          end

           end
            #10 $stop;
           end

endmodule
