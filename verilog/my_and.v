`timescale 1ns / 1ps

module my_and(
    input x0,
    input x1,
    output res
);

    wire nand_x0_x1;
    nand(nand_x0_x1, x0, x1);
    
    nand(res, nand_x0_x1, nand_x0_x1);
    
endmodule
