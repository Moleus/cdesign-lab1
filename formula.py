"""
not(x) = nand(x,x)
and(x, y) = not(nand(x, y))
or(x, y) = nand(not(x), not(y))
nor(x, y) = not(or(x, y))
xor(x, y) = nand(nand(a, nand(a, b)), nand(b, nand(a, b)))
"""

# wolfram formula template
x0 = "(NOT ( a0 XOR b0 ))" # a0 == b0
x1 = "(NOT ( a1 XOR b1 ))" # a1 == b1
x2 = "(NOT ( a2 XOR b2 ))" # a2 == b2
x3 = "(NOT ( a3 XOR b3 ))" # a3 == b3

# (a0 NAND NOT b0) == a0 > b0


a_greater_b_2bit = f"(a1 NAND NOT b1) NAND ( {x1} NAND ( a0 AND NOT b0 ) ) table"
a_greater_b_3_bit = f"(a2 NAND NOT b2) NAND ( {x2} NAND ((a1 NAND NOT b1) NAND ({x1} NAND ( a0 AND NOT b0 )))) table"
a_greater_b_4_bit = f"(a3 NAND NOT b3)NAND({x3} NAND((a2 NAND NOT b2)NAND(({x3} AND {x2})NAND((a1 NAND NOT b1)NAND(({x3} AND {x2} AND {x1})NAND(a0 AND NOT b0 ))))))table"

# (a3 NAND NOT b3) NAND ( (NOT ( a3 XOR b3 )) NAND ((a2 NAND NOT b2) NAND ((NOT ( a2 XOR b2 )) NAND ((a1 NAND NOT b1) NAND ((NOT ( a1 XOR b1 )) NAND ( a0 AND NOT b0 )))))) table
# https://www.wolframalpha.com/input?i=%28a3+NAND+NOT+b3%29+NAND+%28+%28NOT+%28+a3+XOR+b3+%29%29+NAND+%28%28a2+NAND+NOT+b2%29+NAND+%28%28NOT+%28+a2+XOR+b2+%29%29+NAND+%28%28a1+NAND+NOT+b1%29+NAND+%28%28NOT+%28+a1+XOR+b1+%29%29+NAND+%28+a0+AND+NOT+b0+%29%29%29%29%29%29+table
print(f"{a_greater_b_4_bit=}")

a_equals_b_5_bit = f"{x3} AND {x2} AND {x1} AND {x0} table"
print(f"{a_equals_b_5_bit=}")
