1   n61in:
2       n63out-p1
3           x71in-p1
4               x71out-p1
5                   n63in-p1
6                       n61out-p1
7                       n64out-p1
8                           x72in_p1
9                               x73out_p2
20                                  w3eout_p1
10                              x71out-p2
11                              x74out-p2
21                                  w4nout_p1
12              x72out-p1
13                  n64in-p1
14                      n62in-p2
15                      n63out-p2
16              x73out-p1
17              x74out-p1           
18      n62in-p1
%%%%%%%%%%%%%%%%%%%%%%%%
1:      n61in = Input
18+14   y1: n62in = DROP(n61in) + TH(n64in)
5       y2: n63in = WG(x71out)
13      y3: n64in = WG(x72out)
6       y4: n61out = TH(n63in)
        n62out= no signal
2+15    y5: n63out = TH(n61in)+ DROP(n64in)
7       y6: n64out= DROP(n63in)
3       y7: x71in= WG(n63out)
8       y8: x72in= WG(n64out)
        x73in = no signal
        x74in = no signal
4+10    y9: x71out =REF(x71in)+ LEFT(x72in)
12      y10: x72out = RIGHT(x71in)
9+16    y11: x73out = RIGHT(x72in) + TH(x71in)
11+17   y12: x74out = TH(x72in) + LEFT(x71in)
        w3ein = no signal
20      y13: w3eout = WG(x73out)
        w4nin = no signal
21      y14: w4nout = WG(x74out)




        

