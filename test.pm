mdp
const int D01 = 2;
const int D02 = 1;
const int D03 = 2;
const int D04 = 2;
const int D05 = 2;
const int D06 = 3;
const int D12 = 3;
const int D13 = 3;
const int D14 = 4;
const int D15 = 1;
const int D16 = 3;
const int D23 = 4;
const int D24 = 2;
const int D25 = 1;
const int D26 = 2;
const int D34 = 3;
const int D35 = 3;
const int D36 = 3;
const int D45 = 4;
const int D46 = 1;
const int D56 = 2;
const int N = 6;
const int site0 = 0;
const int site1 = 1;
const int site2 = 2;
const int site3 = 3;
const int site4 = 4;
const int site5 = 5;
const int site6 = 6;
const int Ch_MAX = 20;
const int Ca_MAX = 20;
const int Cg_MAX = 20;
const int Sh = 3;
const int Sa = 1;
const int Sg = 2;
const int state0 = 0;
const int state1 = 1;
const int state2 = 2;
const int state3 = 3;
const int state4 = 4;
module human
h: [0..N] init 0;
clock_h: [0..Ch_MAX] init 0;
move_h : bool init false;
[time] clock_h>1 -> (clock_h' = clock_h-1);
[time] clock_h=1 -> (clock_h'=0) & (move_h'=false);
[] clock_h=0 & !move_h -> (clock_h'=1);
endmodule