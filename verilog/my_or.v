`timescale 1ns / 1ps

module my_or(
    input x0,
    input x1,
    output res
);
    wire not_x0, not_x1;
    nand(not_x0,x0,x0);
    nand(not_x1,x1,x1);
    
    nand(res, not_x0, not_x1);
    
endmodule