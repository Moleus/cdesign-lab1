`timescale 1ns / 1ps

module my_prog(
    input[3:0] x0,
    input[3:0] x1,
    output res0,
    output res1,
    output res2
);
 
    wire eq0, eq1, eq2, eq3;
    
    my_eq q0(.x0(x0[0]), .x1(x1[0]), .res(eq0));
    my_eq q1(.x0(x0[1]), .x1(x1[1]), .res(eq1));
    my_eq q2(.x0(x0[2]), .x1(x1[2]), .res(eq2));
    my_eq q3(.x0(x0[3]), .x1(x1[3]), .res(eq3));
    
    wire x0_and_x1, x2_and_x3;
    
//-----------------------res0 - equals----------------------------------------------
    
    my_and q4(.x0(eq0), .x1(eq1), .res(x0_and_x1));
    my_and q5(.x0(eq2), .x1(eq3), .res(x2_and_x3));
    my_and q6(.x0(x0_and_x1), .x1(x2_and_x3), .res(res0));
    
//-----------------------res1 - more------------------------------------------------

    reg [3:0] not_x0_arr;
    reg [3:0] not_x1_arr;
    
    nand(x0[0], x0[0], not_x0_arr[0]);
    nand(x0[1], x0[1], not_x0_arr[1]);
    nand(x0[2], x0[2], not_x0_arr[2]);
    nand(x0[3], x0[3], not_x0_arr[3]);

    nand(x1[0], x1[0], not_x1_arr[0]);
    nand(x1[1], x1[1], not_x1_arr[1]);
    nand(x1[2], x1[2], not_x1_arr[2]);
    nand(x1[3], x1[3], not_x1_arr[3]);
   
   
   wire a3_and_not_b3, a2_and_not_b2, a1_and_not_b1, a0_and_not_b0;
   
   my_and q7(.x0(x0[3]), .x1(not_x1_arr[3]), .res(a3_and_not_b3));
   my_and q8(.x0(x0[2]), .x1(not_x1_arr[2]), .res(a2_and_not_b2));
   my_and q9(.x0(x0[1]), .x1(not_x1_arr[1]), .res(a1_and_not_b1));
   my_and q10(.x0(x0[0]), .x1(not_x1_arr[0]), .res(a0_and_not_b0));
   
   wire eq3_and_eq2, eq3_and_eq2_and_eq1;
   
   my_and q11(.x0(eq3), .x1(eq2), .res(eq3_and_eq2));
   my_and q12(.x0(eq3_and_eq2), .x1(eq1), .res(eq3_and_eq2_and_eq1));
   
    
    wire term_1, term_2, term_3;
    
   my_and q13(.x0(eq3), .x1(a2_and_not_b2), .res(term_1));
   my_and q14(.x0(eq3_and_eq2), .x1(a1_and_not_b1), .res(term_2));
   my_and q15(.x0(eq3_and_eq2_and_eq1), .x1(a0_and_not_b0), .res(term_3));
   
   // result
   
   my_or q16(.x0(a3_and_not_b3), .x1(term_1), .res(res1));
   my_or q17(.x0(res1), .x1(term_2), .res(res1));
   my_or q18(.x0(res1), .x1(term_3), .res(res1));
   
 //---------------------res3 - less------------------------------------------------
 
   my_or q19(.x0(res0), .x1(res1), .res(res2));
   nand(res2, res2, res2);
 
 endmodule
 