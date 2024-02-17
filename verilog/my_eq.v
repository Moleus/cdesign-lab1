`timescale 1ns / 1ps

module my_eq(
    input x0,
    input x1,
    output res
);

    wire not_x0, not_x1, not_x0_and_not_x1, x0_and_x1;
    
    nand(not_x0, x0, x0);
    nand(not_x1, x1, x1);
    
    
    my_and q0(.x0(not_x0), .x1(not_x1), .res(not_x0_and_not_x1));
    my_and q1(.x0(x0), .x1(x1), .res(x0_and_x1));
    
    my_or q2(.x0(x0_and_x1), .x1(not_x0_and_not_x1), .res(res));
    
 endmodule
 