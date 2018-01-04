mdp
// working on trying to lower the state space
// adding random speed for all; based on probability instead.
 
// SITES
const int N = 20; // number of sites
const int site0 = 0;
const int site1 = 1;
const int site2 = 2;
const int site3 = 3;
const int site4 = 4;
const int site5 = 5;
const int site6 = 6;
const int site7 = 7;
const int site8 = 8;
const int site9 = 9;
const int site10 = 10;
const int site11 = 11;
const int site12 = 12;
const int site13 = 13;
const int site14 = 14;
const int site15 = 15;
const int site16 = 16;
const int site17 = 17;
const int site18 = 18;
const int site19 = 19;
const int site20 = 20;

// SITE INFORMATION
const int state0 = 0; // unknown
const int state1 = 1; // fire
const int state2 = 2; // human
const int state3 = 3; // fire+human
const int state4 = 4; // nuteral

// TIMER INFORMATION
const int totClock_max = 200;

module timer
	totClock: [0..totClock_max] init 0;

	[time] totClock<totClock_max -> (totClock'=totClock+1);
endmodule

// main agent module
module human
	h: [0..N] init 0; // position of human (which site the agent is at)
	move_h: bool init false; // human moving (lock for agent movement)

	// time passage
	[time] move_h = true & totClock<totClock_max -> 0.9:(move_h'=false) + 0.1:(move_h'=true);

	// human stays at the same site
	[time] move_h = false & totClock<totClock_max -> true;

	// human movement between sites
	[human_0_0] h=site0 & !move_h -> (h'=site0) & (move_h'=true);
	[human_0_1] h=site0 & !move_h -> (h'=site1) & (move_h'=true);
	[human_0_2] h=site0 & !move_h -> (h'=site2) & (move_h'=true);
	[human_0_3] h=site0 & !move_h -> (h'=site3) & (move_h'=true);
	[human_0_4] h=site0 & !move_h -> (h'=site4) & (move_h'=true);
	[human_0_5] h=site0 & !move_h -> (h'=site5) & (move_h'=true);
	[human_0_6] h=site0 & !move_h -> (h'=site6) & (move_h'=true);
	[human_0_7] h=site0 & !move_h -> (h'=site7) & (move_h'=true);
	[human_0_8] h=site0 & !move_h -> (h'=site8) & (move_h'=true);
	[human_0_9] h=site0 & !move_h -> (h'=site9) & (move_h'=true);
	[human_0_10] h=site0 & !move_h -> (h'=site10) & (move_h'=true);
	[human_0_11] h=site0 & !move_h -> (h'=site11) & (move_h'=true);
	[human_0_12] h=site0 & !move_h -> (h'=site12) & (move_h'=true);
	[human_0_13] h=site0 & !move_h -> (h'=site13) & (move_h'=true);
	[human_0_14] h=site0 & !move_h -> (h'=site14) & (move_h'=true);
	[human_0_15] h=site0 & !move_h -> (h'=site15) & (move_h'=true);
	[human_0_16] h=site0 & !move_h -> (h'=site16) & (move_h'=true);
	[human_0_17] h=site0 & !move_h -> (h'=site17) & (move_h'=true);
	[human_0_18] h=site0 & !move_h -> (h'=site18) & (move_h'=true);
	[human_0_19] h=site0 & !move_h -> (h'=site19) & (move_h'=true);
	[human_0_20] h=site0 & !move_h -> (h'=site20) & (move_h'=true);
	[human_1_0] h=site1 & !move_h -> (h'=site0) & (move_h'=true);
	[human_1_1] h=site1 & !move_h -> (h'=site1) & (move_h'=true);
	[human_1_2] h=site1 & !move_h -> (h'=site2) & (move_h'=true);
	[human_1_3] h=site1 & !move_h -> (h'=site3) & (move_h'=true);
	[human_1_4] h=site1 & !move_h -> (h'=site4) & (move_h'=true);
	[human_1_5] h=site1 & !move_h -> (h'=site5) & (move_h'=true);
	[human_1_6] h=site1 & !move_h -> (h'=site6) & (move_h'=true);
	[human_1_7] h=site1 & !move_h -> (h'=site7) & (move_h'=true);
	[human_1_8] h=site1 & !move_h -> (h'=site8) & (move_h'=true);
	[human_1_9] h=site1 & !move_h -> (h'=site9) & (move_h'=true);
	[human_1_10] h=site1 & !move_h -> (h'=site10) & (move_h'=true);
	[human_1_11] h=site1 & !move_h -> (h'=site11) & (move_h'=true);
	[human_1_12] h=site1 & !move_h -> (h'=site12) & (move_h'=true);
	[human_1_13] h=site1 & !move_h -> (h'=site13) & (move_h'=true);
	[human_1_14] h=site1 & !move_h -> (h'=site14) & (move_h'=true);
	[human_1_15] h=site1 & !move_h -> (h'=site15) & (move_h'=true);
	[human_1_16] h=site1 & !move_h -> (h'=site16) & (move_h'=true);
	[human_1_17] h=site1 & !move_h -> (h'=site17) & (move_h'=true);
	[human_1_18] h=site1 & !move_h -> (h'=site18) & (move_h'=true);
	[human_1_19] h=site1 & !move_h -> (h'=site19) & (move_h'=true);
	[human_1_20] h=site1 & !move_h -> (h'=site20) & (move_h'=true);
	[human_2_0] h=site2 & !move_h -> (h'=site0) & (move_h'=true);
	[human_2_1] h=site2 & !move_h -> (h'=site1) & (move_h'=true);
	[human_2_2] h=site2 & !move_h -> (h'=site2) & (move_h'=true);
	[human_2_3] h=site2 & !move_h -> (h'=site3) & (move_h'=true);
	[human_2_4] h=site2 & !move_h -> (h'=site4) & (move_h'=true);
	[human_2_5] h=site2 & !move_h -> (h'=site5) & (move_h'=true);
	[human_2_6] h=site2 & !move_h -> (h'=site6) & (move_h'=true);
	[human_2_7] h=site2 & !move_h -> (h'=site7) & (move_h'=true);
	[human_2_8] h=site2 & !move_h -> (h'=site8) & (move_h'=true);
	[human_2_9] h=site2 & !move_h -> (h'=site9) & (move_h'=true);
	[human_2_10] h=site2 & !move_h -> (h'=site10) & (move_h'=true);
	[human_2_11] h=site2 & !move_h -> (h'=site11) & (move_h'=true);
	[human_2_12] h=site2 & !move_h -> (h'=site12) & (move_h'=true);
	[human_2_13] h=site2 & !move_h -> (h'=site13) & (move_h'=true);
	[human_2_14] h=site2 & !move_h -> (h'=site14) & (move_h'=true);
	[human_2_15] h=site2 & !move_h -> (h'=site15) & (move_h'=true);
	[human_2_16] h=site2 & !move_h -> (h'=site16) & (move_h'=true);
	[human_2_17] h=site2 & !move_h -> (h'=site17) & (move_h'=true);
	[human_2_18] h=site2 & !move_h -> (h'=site18) & (move_h'=true);
	[human_2_19] h=site2 & !move_h -> (h'=site19) & (move_h'=true);
	[human_2_20] h=site2 & !move_h -> (h'=site20) & (move_h'=true);
	[human_3_0] h=site3 & !move_h -> (h'=site0) & (move_h'=true);
	[human_3_1] h=site3 & !move_h -> (h'=site1) & (move_h'=true);
	[human_3_2] h=site3 & !move_h -> (h'=site2) & (move_h'=true);
	[human_3_3] h=site3 & !move_h -> (h'=site3) & (move_h'=true);
	[human_3_4] h=site3 & !move_h -> (h'=site4) & (move_h'=true);
	[human_3_5] h=site3 & !move_h -> (h'=site5) & (move_h'=true);
	[human_3_6] h=site3 & !move_h -> (h'=site6) & (move_h'=true);
	[human_3_7] h=site3 & !move_h -> (h'=site7) & (move_h'=true);
	[human_3_8] h=site3 & !move_h -> (h'=site8) & (move_h'=true);
	[human_3_9] h=site3 & !move_h -> (h'=site9) & (move_h'=true);
	[human_3_10] h=site3 & !move_h -> (h'=site10) & (move_h'=true);
	[human_3_11] h=site3 & !move_h -> (h'=site11) & (move_h'=true);
	[human_3_12] h=site3 & !move_h -> (h'=site12) & (move_h'=true);
	[human_3_13] h=site3 & !move_h -> (h'=site13) & (move_h'=true);
	[human_3_14] h=site3 & !move_h -> (h'=site14) & (move_h'=true);
	[human_3_15] h=site3 & !move_h -> (h'=site15) & (move_h'=true);
	[human_3_16] h=site3 & !move_h -> (h'=site16) & (move_h'=true);
	[human_3_17] h=site3 & !move_h -> (h'=site17) & (move_h'=true);
	[human_3_18] h=site3 & !move_h -> (h'=site18) & (move_h'=true);
	[human_3_19] h=site3 & !move_h -> (h'=site19) & (move_h'=true);
	[human_3_20] h=site3 & !move_h -> (h'=site20) & (move_h'=true);
	[human_4_0] h=site4 & !move_h -> (h'=site0) & (move_h'=true);
	[human_4_1] h=site4 & !move_h -> (h'=site1) & (move_h'=true);
	[human_4_2] h=site4 & !move_h -> (h'=site2) & (move_h'=true);
	[human_4_3] h=site4 & !move_h -> (h'=site3) & (move_h'=true);
	[human_4_4] h=site4 & !move_h -> (h'=site4) & (move_h'=true);
	[human_4_5] h=site4 & !move_h -> (h'=site5) & (move_h'=true);
	[human_4_6] h=site4 & !move_h -> (h'=site6) & (move_h'=true);
	[human_4_7] h=site4 & !move_h -> (h'=site7) & (move_h'=true);
	[human_4_8] h=site4 & !move_h -> (h'=site8) & (move_h'=true);
	[human_4_9] h=site4 & !move_h -> (h'=site9) & (move_h'=true);
	[human_4_10] h=site4 & !move_h -> (h'=site10) & (move_h'=true);
	[human_4_11] h=site4 & !move_h -> (h'=site11) & (move_h'=true);
	[human_4_12] h=site4 & !move_h -> (h'=site12) & (move_h'=true);
	[human_4_13] h=site4 & !move_h -> (h'=site13) & (move_h'=true);
	[human_4_14] h=site4 & !move_h -> (h'=site14) & (move_h'=true);
	[human_4_15] h=site4 & !move_h -> (h'=site15) & (move_h'=true);
	[human_4_16] h=site4 & !move_h -> (h'=site16) & (move_h'=true);
	[human_4_17] h=site4 & !move_h -> (h'=site17) & (move_h'=true);
	[human_4_18] h=site4 & !move_h -> (h'=site18) & (move_h'=true);
	[human_4_19] h=site4 & !move_h -> (h'=site19) & (move_h'=true);
	[human_4_20] h=site4 & !move_h -> (h'=site20) & (move_h'=true);
	[human_5_0] h=site5 & !move_h -> (h'=site0) & (move_h'=true);
	[human_5_1] h=site5 & !move_h -> (h'=site1) & (move_h'=true);
	[human_5_2] h=site5 & !move_h -> (h'=site2) & (move_h'=true);
	[human_5_3] h=site5 & !move_h -> (h'=site3) & (move_h'=true);
	[human_5_4] h=site5 & !move_h -> (h'=site4) & (move_h'=true);
	[human_5_5] h=site5 & !move_h -> (h'=site5) & (move_h'=true);
	[human_5_6] h=site5 & !move_h -> (h'=site6) & (move_h'=true);
	[human_5_7] h=site5 & !move_h -> (h'=site7) & (move_h'=true);
	[human_5_8] h=site5 & !move_h -> (h'=site8) & (move_h'=true);
	[human_5_9] h=site5 & !move_h -> (h'=site9) & (move_h'=true);
	[human_5_10] h=site5 & !move_h -> (h'=site10) & (move_h'=true);
	[human_5_11] h=site5 & !move_h -> (h'=site11) & (move_h'=true);
	[human_5_12] h=site5 & !move_h -> (h'=site12) & (move_h'=true);
	[human_5_13] h=site5 & !move_h -> (h'=site13) & (move_h'=true);
	[human_5_14] h=site5 & !move_h -> (h'=site14) & (move_h'=true);
	[human_5_15] h=site5 & !move_h -> (h'=site15) & (move_h'=true);
	[human_5_16] h=site5 & !move_h -> (h'=site16) & (move_h'=true);
	[human_5_17] h=site5 & !move_h -> (h'=site17) & (move_h'=true);
	[human_5_18] h=site5 & !move_h -> (h'=site18) & (move_h'=true);
	[human_5_19] h=site5 & !move_h -> (h'=site19) & (move_h'=true);
	[human_5_20] h=site5 & !move_h -> (h'=site20) & (move_h'=true);
	[human_6_0] h=site6 & !move_h -> (h'=site0) & (move_h'=true);
	[human_6_1] h=site6 & !move_h -> (h'=site1) & (move_h'=true);
	[human_6_2] h=site6 & !move_h -> (h'=site2) & (move_h'=true);
	[human_6_3] h=site6 & !move_h -> (h'=site3) & (move_h'=true);
	[human_6_4] h=site6 & !move_h -> (h'=site4) & (move_h'=true);
	[human_6_5] h=site6 & !move_h -> (h'=site5) & (move_h'=true);
	[human_6_6] h=site6 & !move_h -> (h'=site6) & (move_h'=true);
	[human_6_7] h=site6 & !move_h -> (h'=site7) & (move_h'=true);
	[human_6_8] h=site6 & !move_h -> (h'=site8) & (move_h'=true);
	[human_6_9] h=site6 & !move_h -> (h'=site9) & (move_h'=true);
	[human_6_10] h=site6 & !move_h -> (h'=site10) & (move_h'=true);
	[human_6_11] h=site6 & !move_h -> (h'=site11) & (move_h'=true);
	[human_6_12] h=site6 & !move_h -> (h'=site12) & (move_h'=true);
	[human_6_13] h=site6 & !move_h -> (h'=site13) & (move_h'=true);
	[human_6_14] h=site6 & !move_h -> (h'=site14) & (move_h'=true);
	[human_6_15] h=site6 & !move_h -> (h'=site15) & (move_h'=true);
	[human_6_16] h=site6 & !move_h -> (h'=site16) & (move_h'=true);
	[human_6_17] h=site6 & !move_h -> (h'=site17) & (move_h'=true);
	[human_6_18] h=site6 & !move_h -> (h'=site18) & (move_h'=true);
	[human_6_19] h=site6 & !move_h -> (h'=site19) & (move_h'=true);
	[human_6_20] h=site6 & !move_h -> (h'=site20) & (move_h'=true);
	[human_7_0] h=site7 & !move_h -> (h'=site0) & (move_h'=true);
	[human_7_1] h=site7 & !move_h -> (h'=site1) & (move_h'=true);
	[human_7_2] h=site7 & !move_h -> (h'=site2) & (move_h'=true);
	[human_7_3] h=site7 & !move_h -> (h'=site3) & (move_h'=true);
	[human_7_4] h=site7 & !move_h -> (h'=site4) & (move_h'=true);
	[human_7_5] h=site7 & !move_h -> (h'=site5) & (move_h'=true);
	[human_7_6] h=site7 & !move_h -> (h'=site6) & (move_h'=true);
	[human_7_7] h=site7 & !move_h -> (h'=site7) & (move_h'=true);
	[human_7_8] h=site7 & !move_h -> (h'=site8) & (move_h'=true);
	[human_7_9] h=site7 & !move_h -> (h'=site9) & (move_h'=true);
	[human_7_10] h=site7 & !move_h -> (h'=site10) & (move_h'=true);
	[human_7_11] h=site7 & !move_h -> (h'=site11) & (move_h'=true);
	[human_7_12] h=site7 & !move_h -> (h'=site12) & (move_h'=true);
	[human_7_13] h=site7 & !move_h -> (h'=site13) & (move_h'=true);
	[human_7_14] h=site7 & !move_h -> (h'=site14) & (move_h'=true);
	[human_7_15] h=site7 & !move_h -> (h'=site15) & (move_h'=true);
	[human_7_16] h=site7 & !move_h -> (h'=site16) & (move_h'=true);
	[human_7_17] h=site7 & !move_h -> (h'=site17) & (move_h'=true);
	[human_7_18] h=site7 & !move_h -> (h'=site18) & (move_h'=true);
	[human_7_19] h=site7 & !move_h -> (h'=site19) & (move_h'=true);
	[human_7_20] h=site7 & !move_h -> (h'=site20) & (move_h'=true);
	[human_8_0] h=site8 & !move_h -> (h'=site0) & (move_h'=true);
	[human_8_1] h=site8 & !move_h -> (h'=site1) & (move_h'=true);
	[human_8_2] h=site8 & !move_h -> (h'=site2) & (move_h'=true);
	[human_8_3] h=site8 & !move_h -> (h'=site3) & (move_h'=true);
	[human_8_4] h=site8 & !move_h -> (h'=site4) & (move_h'=true);
	[human_8_5] h=site8 & !move_h -> (h'=site5) & (move_h'=true);
	[human_8_6] h=site8 & !move_h -> (h'=site6) & (move_h'=true);
	[human_8_7] h=site8 & !move_h -> (h'=site7) & (move_h'=true);
	[human_8_8] h=site8 & !move_h -> (h'=site8) & (move_h'=true);
	[human_8_9] h=site8 & !move_h -> (h'=site9) & (move_h'=true);
	[human_8_10] h=site8 & !move_h -> (h'=site10) & (move_h'=true);
	[human_8_11] h=site8 & !move_h -> (h'=site11) & (move_h'=true);
	[human_8_12] h=site8 & !move_h -> (h'=site12) & (move_h'=true);
	[human_8_13] h=site8 & !move_h -> (h'=site13) & (move_h'=true);
	[human_8_14] h=site8 & !move_h -> (h'=site14) & (move_h'=true);
	[human_8_15] h=site8 & !move_h -> (h'=site15) & (move_h'=true);
	[human_8_16] h=site8 & !move_h -> (h'=site16) & (move_h'=true);
	[human_8_17] h=site8 & !move_h -> (h'=site17) & (move_h'=true);
	[human_8_18] h=site8 & !move_h -> (h'=site18) & (move_h'=true);
	[human_8_19] h=site8 & !move_h -> (h'=site19) & (move_h'=true);
	[human_8_20] h=site8 & !move_h -> (h'=site20) & (move_h'=true);
	[human_9_0] h=site9 & !move_h -> (h'=site0) & (move_h'=true);
	[human_9_1] h=site9 & !move_h -> (h'=site1) & (move_h'=true);
	[human_9_2] h=site9 & !move_h -> (h'=site2) & (move_h'=true);
	[human_9_3] h=site9 & !move_h -> (h'=site3) & (move_h'=true);
	[human_9_4] h=site9 & !move_h -> (h'=site4) & (move_h'=true);
	[human_9_5] h=site9 & !move_h -> (h'=site5) & (move_h'=true);
	[human_9_6] h=site9 & !move_h -> (h'=site6) & (move_h'=true);
	[human_9_7] h=site9 & !move_h -> (h'=site7) & (move_h'=true);
	[human_9_8] h=site9 & !move_h -> (h'=site8) & (move_h'=true);
	[human_9_9] h=site9 & !move_h -> (h'=site9) & (move_h'=true);
	[human_9_10] h=site9 & !move_h -> (h'=site10) & (move_h'=true);
	[human_9_11] h=site9 & !move_h -> (h'=site11) & (move_h'=true);
	[human_9_12] h=site9 & !move_h -> (h'=site12) & (move_h'=true);
	[human_9_13] h=site9 & !move_h -> (h'=site13) & (move_h'=true);
	[human_9_14] h=site9 & !move_h -> (h'=site14) & (move_h'=true);
	[human_9_15] h=site9 & !move_h -> (h'=site15) & (move_h'=true);
	[human_9_16] h=site9 & !move_h -> (h'=site16) & (move_h'=true);
	[human_9_17] h=site9 & !move_h -> (h'=site17) & (move_h'=true);
	[human_9_18] h=site9 & !move_h -> (h'=site18) & (move_h'=true);
	[human_9_19] h=site9 & !move_h -> (h'=site19) & (move_h'=true);
	[human_9_20] h=site9 & !move_h -> (h'=site20) & (move_h'=true);
	[human_10_0] h=site10 & !move_h -> (h'=site0) & (move_h'=true);
	[human_10_1] h=site10 & !move_h -> (h'=site1) & (move_h'=true);
	[human_10_2] h=site10 & !move_h -> (h'=site2) & (move_h'=true);
	[human_10_3] h=site10 & !move_h -> (h'=site3) & (move_h'=true);
	[human_10_4] h=site10 & !move_h -> (h'=site4) & (move_h'=true);
	[human_10_5] h=site10 & !move_h -> (h'=site5) & (move_h'=true);
	[human_10_6] h=site10 & !move_h -> (h'=site6) & (move_h'=true);
	[human_10_7] h=site10 & !move_h -> (h'=site7) & (move_h'=true);
	[human_10_8] h=site10 & !move_h -> (h'=site8) & (move_h'=true);
	[human_10_9] h=site10 & !move_h -> (h'=site9) & (move_h'=true);
	[human_10_10] h=site10 & !move_h -> (h'=site10) & (move_h'=true);
	[human_10_11] h=site10 & !move_h -> (h'=site11) & (move_h'=true);
	[human_10_12] h=site10 & !move_h -> (h'=site12) & (move_h'=true);
	[human_10_13] h=site10 & !move_h -> (h'=site13) & (move_h'=true);
	[human_10_14] h=site10 & !move_h -> (h'=site14) & (move_h'=true);
	[human_10_15] h=site10 & !move_h -> (h'=site15) & (move_h'=true);
	[human_10_16] h=site10 & !move_h -> (h'=site16) & (move_h'=true);
	[human_10_17] h=site10 & !move_h -> (h'=site17) & (move_h'=true);
	[human_10_18] h=site10 & !move_h -> (h'=site18) & (move_h'=true);
	[human_10_19] h=site10 & !move_h -> (h'=site19) & (move_h'=true);
	[human_10_20] h=site10 & !move_h -> (h'=site20) & (move_h'=true);
	[human_11_0] h=site11 & !move_h -> (h'=site0) & (move_h'=true);
	[human_11_1] h=site11 & !move_h -> (h'=site1) & (move_h'=true);
	[human_11_2] h=site11 & !move_h -> (h'=site2) & (move_h'=true);
	[human_11_3] h=site11 & !move_h -> (h'=site3) & (move_h'=true);
	[human_11_4] h=site11 & !move_h -> (h'=site4) & (move_h'=true);
	[human_11_5] h=site11 & !move_h -> (h'=site5) & (move_h'=true);
	[human_11_6] h=site11 & !move_h -> (h'=site6) & (move_h'=true);
	[human_11_7] h=site11 & !move_h -> (h'=site7) & (move_h'=true);
	[human_11_8] h=site11 & !move_h -> (h'=site8) & (move_h'=true);
	[human_11_9] h=site11 & !move_h -> (h'=site9) & (move_h'=true);
	[human_11_10] h=site11 & !move_h -> (h'=site10) & (move_h'=true);
	[human_11_11] h=site11 & !move_h -> (h'=site11) & (move_h'=true);
	[human_11_12] h=site11 & !move_h -> (h'=site12) & (move_h'=true);
	[human_11_13] h=site11 & !move_h -> (h'=site13) & (move_h'=true);
	[human_11_14] h=site11 & !move_h -> (h'=site14) & (move_h'=true);
	[human_11_15] h=site11 & !move_h -> (h'=site15) & (move_h'=true);
	[human_11_16] h=site11 & !move_h -> (h'=site16) & (move_h'=true);
	[human_11_17] h=site11 & !move_h -> (h'=site17) & (move_h'=true);
	[human_11_18] h=site11 & !move_h -> (h'=site18) & (move_h'=true);
	[human_11_19] h=site11 & !move_h -> (h'=site19) & (move_h'=true);
	[human_11_20] h=site11 & !move_h -> (h'=site20) & (move_h'=true);
	[human_12_0] h=site12 & !move_h -> (h'=site0) & (move_h'=true);
	[human_12_1] h=site12 & !move_h -> (h'=site1) & (move_h'=true);
	[human_12_2] h=site12 & !move_h -> (h'=site2) & (move_h'=true);
	[human_12_3] h=site12 & !move_h -> (h'=site3) & (move_h'=true);
	[human_12_4] h=site12 & !move_h -> (h'=site4) & (move_h'=true);
	[human_12_5] h=site12 & !move_h -> (h'=site5) & (move_h'=true);
	[human_12_6] h=site12 & !move_h -> (h'=site6) & (move_h'=true);
	[human_12_7] h=site12 & !move_h -> (h'=site7) & (move_h'=true);
	[human_12_8] h=site12 & !move_h -> (h'=site8) & (move_h'=true);
	[human_12_9] h=site12 & !move_h -> (h'=site9) & (move_h'=true);
	[human_12_10] h=site12 & !move_h -> (h'=site10) & (move_h'=true);
	[human_12_11] h=site12 & !move_h -> (h'=site11) & (move_h'=true);
	[human_12_12] h=site12 & !move_h -> (h'=site12) & (move_h'=true);
	[human_12_13] h=site12 & !move_h -> (h'=site13) & (move_h'=true);
	[human_12_14] h=site12 & !move_h -> (h'=site14) & (move_h'=true);
	[human_12_15] h=site12 & !move_h -> (h'=site15) & (move_h'=true);
	[human_12_16] h=site12 & !move_h -> (h'=site16) & (move_h'=true);
	[human_12_17] h=site12 & !move_h -> (h'=site17) & (move_h'=true);
	[human_12_18] h=site12 & !move_h -> (h'=site18) & (move_h'=true);
	[human_12_19] h=site12 & !move_h -> (h'=site19) & (move_h'=true);
	[human_12_20] h=site12 & !move_h -> (h'=site20) & (move_h'=true);
	[human_13_0] h=site13 & !move_h -> (h'=site0) & (move_h'=true);
	[human_13_1] h=site13 & !move_h -> (h'=site1) & (move_h'=true);
	[human_13_2] h=site13 & !move_h -> (h'=site2) & (move_h'=true);
	[human_13_3] h=site13 & !move_h -> (h'=site3) & (move_h'=true);
	[human_13_4] h=site13 & !move_h -> (h'=site4) & (move_h'=true);
	[human_13_5] h=site13 & !move_h -> (h'=site5) & (move_h'=true);
	[human_13_6] h=site13 & !move_h -> (h'=site6) & (move_h'=true);
	[human_13_7] h=site13 & !move_h -> (h'=site7) & (move_h'=true);
	[human_13_8] h=site13 & !move_h -> (h'=site8) & (move_h'=true);
	[human_13_9] h=site13 & !move_h -> (h'=site9) & (move_h'=true);
	[human_13_10] h=site13 & !move_h -> (h'=site10) & (move_h'=true);
	[human_13_11] h=site13 & !move_h -> (h'=site11) & (move_h'=true);
	[human_13_12] h=site13 & !move_h -> (h'=site12) & (move_h'=true);
	[human_13_13] h=site13 & !move_h -> (h'=site13) & (move_h'=true);
	[human_13_14] h=site13 & !move_h -> (h'=site14) & (move_h'=true);
	[human_13_15] h=site13 & !move_h -> (h'=site15) & (move_h'=true);
	[human_13_16] h=site13 & !move_h -> (h'=site16) & (move_h'=true);
	[human_13_17] h=site13 & !move_h -> (h'=site17) & (move_h'=true);
	[human_13_18] h=site13 & !move_h -> (h'=site18) & (move_h'=true);
	[human_13_19] h=site13 & !move_h -> (h'=site19) & (move_h'=true);
	[human_13_20] h=site13 & !move_h -> (h'=site20) & (move_h'=true);
	[human_14_0] h=site14 & !move_h -> (h'=site0) & (move_h'=true);
	[human_14_1] h=site14 & !move_h -> (h'=site1) & (move_h'=true);
	[human_14_2] h=site14 & !move_h -> (h'=site2) & (move_h'=true);
	[human_14_3] h=site14 & !move_h -> (h'=site3) & (move_h'=true);
	[human_14_4] h=site14 & !move_h -> (h'=site4) & (move_h'=true);
	[human_14_5] h=site14 & !move_h -> (h'=site5) & (move_h'=true);
	[human_14_6] h=site14 & !move_h -> (h'=site6) & (move_h'=true);
	[human_14_7] h=site14 & !move_h -> (h'=site7) & (move_h'=true);
	[human_14_8] h=site14 & !move_h -> (h'=site8) & (move_h'=true);
	[human_14_9] h=site14 & !move_h -> (h'=site9) & (move_h'=true);
	[human_14_10] h=site14 & !move_h -> (h'=site10) & (move_h'=true);
	[human_14_11] h=site14 & !move_h -> (h'=site11) & (move_h'=true);
	[human_14_12] h=site14 & !move_h -> (h'=site12) & (move_h'=true);
	[human_14_13] h=site14 & !move_h -> (h'=site13) & (move_h'=true);
	[human_14_14] h=site14 & !move_h -> (h'=site14) & (move_h'=true);
	[human_14_15] h=site14 & !move_h -> (h'=site15) & (move_h'=true);
	[human_14_16] h=site14 & !move_h -> (h'=site16) & (move_h'=true);
	[human_14_17] h=site14 & !move_h -> (h'=site17) & (move_h'=true);
	[human_14_18] h=site14 & !move_h -> (h'=site18) & (move_h'=true);
	[human_14_19] h=site14 & !move_h -> (h'=site19) & (move_h'=true);
	[human_14_20] h=site14 & !move_h -> (h'=site20) & (move_h'=true);
	[human_15_0] h=site15 & !move_h -> (h'=site0) & (move_h'=true);
	[human_15_1] h=site15 & !move_h -> (h'=site1) & (move_h'=true);
	[human_15_2] h=site15 & !move_h -> (h'=site2) & (move_h'=true);
	[human_15_3] h=site15 & !move_h -> (h'=site3) & (move_h'=true);
	[human_15_4] h=site15 & !move_h -> (h'=site4) & (move_h'=true);
	[human_15_5] h=site15 & !move_h -> (h'=site5) & (move_h'=true);
	[human_15_6] h=site15 & !move_h -> (h'=site6) & (move_h'=true);
	[human_15_7] h=site15 & !move_h -> (h'=site7) & (move_h'=true);
	[human_15_8] h=site15 & !move_h -> (h'=site8) & (move_h'=true);
	[human_15_9] h=site15 & !move_h -> (h'=site9) & (move_h'=true);
	[human_15_10] h=site15 & !move_h -> (h'=site10) & (move_h'=true);
	[human_15_11] h=site15 & !move_h -> (h'=site11) & (move_h'=true);
	[human_15_12] h=site15 & !move_h -> (h'=site12) & (move_h'=true);
	[human_15_13] h=site15 & !move_h -> (h'=site13) & (move_h'=true);
	[human_15_14] h=site15 & !move_h -> (h'=site14) & (move_h'=true);
	[human_15_15] h=site15 & !move_h -> (h'=site15) & (move_h'=true);
	[human_15_16] h=site15 & !move_h -> (h'=site16) & (move_h'=true);
	[human_15_17] h=site15 & !move_h -> (h'=site17) & (move_h'=true);
	[human_15_18] h=site15 & !move_h -> (h'=site18) & (move_h'=true);
	[human_15_19] h=site15 & !move_h -> (h'=site19) & (move_h'=true);
	[human_15_20] h=site15 & !move_h -> (h'=site20) & (move_h'=true);
	[human_16_0] h=site16 & !move_h -> (h'=site0) & (move_h'=true);
	[human_16_1] h=site16 & !move_h -> (h'=site1) & (move_h'=true);
	[human_16_2] h=site16 & !move_h -> (h'=site2) & (move_h'=true);
	[human_16_3] h=site16 & !move_h -> (h'=site3) & (move_h'=true);
	[human_16_4] h=site16 & !move_h -> (h'=site4) & (move_h'=true);
	[human_16_5] h=site16 & !move_h -> (h'=site5) & (move_h'=true);
	[human_16_6] h=site16 & !move_h -> (h'=site6) & (move_h'=true);
	[human_16_7] h=site16 & !move_h -> (h'=site7) & (move_h'=true);
	[human_16_8] h=site16 & !move_h -> (h'=site8) & (move_h'=true);
	[human_16_9] h=site16 & !move_h -> (h'=site9) & (move_h'=true);
	[human_16_10] h=site16 & !move_h -> (h'=site10) & (move_h'=true);
	[human_16_11] h=site16 & !move_h -> (h'=site11) & (move_h'=true);
	[human_16_12] h=site16 & !move_h -> (h'=site12) & (move_h'=true);
	[human_16_13] h=site16 & !move_h -> (h'=site13) & (move_h'=true);
	[human_16_14] h=site16 & !move_h -> (h'=site14) & (move_h'=true);
	[human_16_15] h=site16 & !move_h -> (h'=site15) & (move_h'=true);
	[human_16_16] h=site16 & !move_h -> (h'=site16) & (move_h'=true);
	[human_16_17] h=site16 & !move_h -> (h'=site17) & (move_h'=true);
	[human_16_18] h=site16 & !move_h -> (h'=site18) & (move_h'=true);
	[human_16_19] h=site16 & !move_h -> (h'=site19) & (move_h'=true);
	[human_16_20] h=site16 & !move_h -> (h'=site20) & (move_h'=true);
	[human_17_0] h=site17 & !move_h -> (h'=site0) & (move_h'=true);
	[human_17_1] h=site17 & !move_h -> (h'=site1) & (move_h'=true);
	[human_17_2] h=site17 & !move_h -> (h'=site2) & (move_h'=true);
	[human_17_3] h=site17 & !move_h -> (h'=site3) & (move_h'=true);
	[human_17_4] h=site17 & !move_h -> (h'=site4) & (move_h'=true);
	[human_17_5] h=site17 & !move_h -> (h'=site5) & (move_h'=true);
	[human_17_6] h=site17 & !move_h -> (h'=site6) & (move_h'=true);
	[human_17_7] h=site17 & !move_h -> (h'=site7) & (move_h'=true);
	[human_17_8] h=site17 & !move_h -> (h'=site8) & (move_h'=true);
	[human_17_9] h=site17 & !move_h -> (h'=site9) & (move_h'=true);
	[human_17_10] h=site17 & !move_h -> (h'=site10) & (move_h'=true);
	[human_17_11] h=site17 & !move_h -> (h'=site11) & (move_h'=true);
	[human_17_12] h=site17 & !move_h -> (h'=site12) & (move_h'=true);
	[human_17_13] h=site17 & !move_h -> (h'=site13) & (move_h'=true);
	[human_17_14] h=site17 & !move_h -> (h'=site14) & (move_h'=true);
	[human_17_15] h=site17 & !move_h -> (h'=site15) & (move_h'=true);
	[human_17_16] h=site17 & !move_h -> (h'=site16) & (move_h'=true);
	[human_17_17] h=site17 & !move_h -> (h'=site17) & (move_h'=true);
	[human_17_18] h=site17 & !move_h -> (h'=site18) & (move_h'=true);
	[human_17_19] h=site17 & !move_h -> (h'=site19) & (move_h'=true);
	[human_17_20] h=site17 & !move_h -> (h'=site20) & (move_h'=true);
	[human_18_0] h=site18 & !move_h -> (h'=site0) & (move_h'=true);
	[human_18_1] h=site18 & !move_h -> (h'=site1) & (move_h'=true);
	[human_18_2] h=site18 & !move_h -> (h'=site2) & (move_h'=true);
	[human_18_3] h=site18 & !move_h -> (h'=site3) & (move_h'=true);
	[human_18_4] h=site18 & !move_h -> (h'=site4) & (move_h'=true);
	[human_18_5] h=site18 & !move_h -> (h'=site5) & (move_h'=true);
	[human_18_6] h=site18 & !move_h -> (h'=site6) & (move_h'=true);
	[human_18_7] h=site18 & !move_h -> (h'=site7) & (move_h'=true);
	[human_18_8] h=site18 & !move_h -> (h'=site8) & (move_h'=true);
	[human_18_9] h=site18 & !move_h -> (h'=site9) & (move_h'=true);
	[human_18_10] h=site18 & !move_h -> (h'=site10) & (move_h'=true);
	[human_18_11] h=site18 & !move_h -> (h'=site11) & (move_h'=true);
	[human_18_12] h=site18 & !move_h -> (h'=site12) & (move_h'=true);
	[human_18_13] h=site18 & !move_h -> (h'=site13) & (move_h'=true);
	[human_18_14] h=site18 & !move_h -> (h'=site14) & (move_h'=true);
	[human_18_15] h=site18 & !move_h -> (h'=site15) & (move_h'=true);
	[human_18_16] h=site18 & !move_h -> (h'=site16) & (move_h'=true);
	[human_18_17] h=site18 & !move_h -> (h'=site17) & (move_h'=true);
	[human_18_18] h=site18 & !move_h -> (h'=site18) & (move_h'=true);
	[human_18_19] h=site18 & !move_h -> (h'=site19) & (move_h'=true);
	[human_18_20] h=site18 & !move_h -> (h'=site20) & (move_h'=true);
	[human_19_0] h=site19 & !move_h -> (h'=site0) & (move_h'=true);
	[human_19_1] h=site19 & !move_h -> (h'=site1) & (move_h'=true);
	[human_19_2] h=site19 & !move_h -> (h'=site2) & (move_h'=true);
	[human_19_3] h=site19 & !move_h -> (h'=site3) & (move_h'=true);
	[human_19_4] h=site19 & !move_h -> (h'=site4) & (move_h'=true);
	[human_19_5] h=site19 & !move_h -> (h'=site5) & (move_h'=true);
	[human_19_6] h=site19 & !move_h -> (h'=site6) & (move_h'=true);
	[human_19_7] h=site19 & !move_h -> (h'=site7) & (move_h'=true);
	[human_19_8] h=site19 & !move_h -> (h'=site8) & (move_h'=true);
	[human_19_9] h=site19 & !move_h -> (h'=site9) & (move_h'=true);
	[human_19_10] h=site19 & !move_h -> (h'=site10) & (move_h'=true);
	[human_19_11] h=site19 & !move_h -> (h'=site11) & (move_h'=true);
	[human_19_12] h=site19 & !move_h -> (h'=site12) & (move_h'=true);
	[human_19_13] h=site19 & !move_h -> (h'=site13) & (move_h'=true);
	[human_19_14] h=site19 & !move_h -> (h'=site14) & (move_h'=true);
	[human_19_15] h=site19 & !move_h -> (h'=site15) & (move_h'=true);
	[human_19_16] h=site19 & !move_h -> (h'=site16) & (move_h'=true);
	[human_19_17] h=site19 & !move_h -> (h'=site17) & (move_h'=true);
	[human_19_18] h=site19 & !move_h -> (h'=site18) & (move_h'=true);
	[human_19_19] h=site19 & !move_h -> (h'=site19) & (move_h'=true);
	[human_19_20] h=site19 & !move_h -> (h'=site20) & (move_h'=true);
	[human_20_0] h=site20 & !move_h -> (h'=site0) & (move_h'=true);
	[human_20_1] h=site20 & !move_h -> (h'=site1) & (move_h'=true);
	[human_20_2] h=site20 & !move_h -> (h'=site2) & (move_h'=true);
	[human_20_3] h=site20 & !move_h -> (h'=site3) & (move_h'=true);
	[human_20_4] h=site20 & !move_h -> (h'=site4) & (move_h'=true);
	[human_20_5] h=site20 & !move_h -> (h'=site5) & (move_h'=true);
	[human_20_6] h=site20 & !move_h -> (h'=site6) & (move_h'=true);
	[human_20_7] h=site20 & !move_h -> (h'=site7) & (move_h'=true);
	[human_20_8] h=site20 & !move_h -> (h'=site8) & (move_h'=true);
	[human_20_9] h=site20 & !move_h -> (h'=site9) & (move_h'=true);
	[human_20_10] h=site20 & !move_h -> (h'=site10) & (move_h'=true);
	[human_20_11] h=site20 & !move_h -> (h'=site11) & (move_h'=true);
	[human_20_12] h=site20 & !move_h -> (h'=site12) & (move_h'=true);
	[human_20_13] h=site20 & !move_h -> (h'=site13) & (move_h'=true);
	[human_20_14] h=site20 & !move_h -> (h'=site14) & (move_h'=true);
	[human_20_15] h=site20 & !move_h -> (h'=site15) & (move_h'=true);
	[human_20_16] h=site20 & !move_h -> (h'=site16) & (move_h'=true);
	[human_20_17] h=site20 & !move_h -> (h'=site17) & (move_h'=true);
	[human_20_18] h=site20 & !move_h -> (h'=site18) & (move_h'=true);
	[human_20_19] h=site20 & !move_h -> (h'=site19) & (move_h'=true);
	[human_20_20] h=site20 & !move_h -> (h'=site20) & (move_h'=true);
endmodule

// uav agent
module uav = human [h=a, move_h=move_a,
human_0_0=uav_0_0, human_0_1=uav_0_1, human_0_2=uav_0_2, human_0_3=uav_0_3, human_0_4=uav_0_4, human_0_5=uav_0_5, human_0_6=uav_0_6, human_0_7=uav_0_7, human_0_8=uav_0_8, human_0_9=uav_0_9, human_0_10=uav_0_10, human_0_11=uav_0_11, human_0_12=uav_0_12, human_0_13=uav_0_13, human_0_14=uav_0_14, human_0_15=uav_0_15, human_0_16=uav_0_16, human_0_17=uav_0_17, human_0_18=uav_0_18, human_0_19=uav_0_19, human_0_20=uav_0_20, 
human_1_0=uav_1_0, human_1_1=uav_1_1, human_1_2=uav_1_2, human_1_3=uav_1_3, human_1_4=uav_1_4, human_1_5=uav_1_5, human_1_6=uav_1_6, human_1_7=uav_1_7, human_1_8=uav_1_8, human_1_9=uav_1_9, human_1_10=uav_1_10, human_1_11=uav_1_11, human_1_12=uav_1_12, human_1_13=uav_1_13, human_1_14=uav_1_14, human_1_15=uav_1_15, human_1_16=uav_1_16, human_1_17=uav_1_17, human_1_18=uav_1_18, human_1_19=uav_1_19, human_1_20=uav_1_20, 
human_2_0=uav_2_0, human_2_1=uav_2_1, human_2_2=uav_2_2, human_2_3=uav_2_3, human_2_4=uav_2_4, human_2_5=uav_2_5, human_2_6=uav_2_6, human_2_7=uav_2_7, human_2_8=uav_2_8, human_2_9=uav_2_9, human_2_10=uav_2_10, human_2_11=uav_2_11, human_2_12=uav_2_12, human_2_13=uav_2_13, human_2_14=uav_2_14, human_2_15=uav_2_15, human_2_16=uav_2_16, human_2_17=uav_2_17, human_2_18=uav_2_18, human_2_19=uav_2_19, human_2_20=uav_2_20, 
human_3_0=uav_3_0, human_3_1=uav_3_1, human_3_2=uav_3_2, human_3_3=uav_3_3, human_3_4=uav_3_4, human_3_5=uav_3_5, human_3_6=uav_3_6, human_3_7=uav_3_7, human_3_8=uav_3_8, human_3_9=uav_3_9, human_3_10=uav_3_10, human_3_11=uav_3_11, human_3_12=uav_3_12, human_3_13=uav_3_13, human_3_14=uav_3_14, human_3_15=uav_3_15, human_3_16=uav_3_16, human_3_17=uav_3_17, human_3_18=uav_3_18, human_3_19=uav_3_19, human_3_20=uav_3_20, 
human_4_0=uav_4_0, human_4_1=uav_4_1, human_4_2=uav_4_2, human_4_3=uav_4_3, human_4_4=uav_4_4, human_4_5=uav_4_5, human_4_6=uav_4_6, human_4_7=uav_4_7, human_4_8=uav_4_8, human_4_9=uav_4_9, human_4_10=uav_4_10, human_4_11=uav_4_11, human_4_12=uav_4_12, human_4_13=uav_4_13, human_4_14=uav_4_14, human_4_15=uav_4_15, human_4_16=uav_4_16, human_4_17=uav_4_17, human_4_18=uav_4_18, human_4_19=uav_4_19, human_4_20=uav_4_20, 
human_5_0=uav_5_0, human_5_1=uav_5_1, human_5_2=uav_5_2, human_5_3=uav_5_3, human_5_4=uav_5_4, human_5_5=uav_5_5, human_5_6=uav_5_6, human_5_7=uav_5_7, human_5_8=uav_5_8, human_5_9=uav_5_9, human_5_10=uav_5_10, human_5_11=uav_5_11, human_5_12=uav_5_12, human_5_13=uav_5_13, human_5_14=uav_5_14, human_5_15=uav_5_15, human_5_16=uav_5_16, human_5_17=uav_5_17, human_5_18=uav_5_18, human_5_19=uav_5_19, human_5_20=uav_5_20, 
human_6_0=uav_6_0, human_6_1=uav_6_1, human_6_2=uav_6_2, human_6_3=uav_6_3, human_6_4=uav_6_4, human_6_5=uav_6_5, human_6_6=uav_6_6, human_6_7=uav_6_7, human_6_8=uav_6_8, human_6_9=uav_6_9, human_6_10=uav_6_10, human_6_11=uav_6_11, human_6_12=uav_6_12, human_6_13=uav_6_13, human_6_14=uav_6_14, human_6_15=uav_6_15, human_6_16=uav_6_16, human_6_17=uav_6_17, human_6_18=uav_6_18, human_6_19=uav_6_19, human_6_20=uav_6_20, 
human_7_0=uav_7_0, human_7_1=uav_7_1, human_7_2=uav_7_2, human_7_3=uav_7_3, human_7_4=uav_7_4, human_7_5=uav_7_5, human_7_6=uav_7_6, human_7_7=uav_7_7, human_7_8=uav_7_8, human_7_9=uav_7_9, human_7_10=uav_7_10, human_7_11=uav_7_11, human_7_12=uav_7_12, human_7_13=uav_7_13, human_7_14=uav_7_14, human_7_15=uav_7_15, human_7_16=uav_7_16, human_7_17=uav_7_17, human_7_18=uav_7_18, human_7_19=uav_7_19, human_7_20=uav_7_20, 
human_8_0=uav_8_0, human_8_1=uav_8_1, human_8_2=uav_8_2, human_8_3=uav_8_3, human_8_4=uav_8_4, human_8_5=uav_8_5, human_8_6=uav_8_6, human_8_7=uav_8_7, human_8_8=uav_8_8, human_8_9=uav_8_9, human_8_10=uav_8_10, human_8_11=uav_8_11, human_8_12=uav_8_12, human_8_13=uav_8_13, human_8_14=uav_8_14, human_8_15=uav_8_15, human_8_16=uav_8_16, human_8_17=uav_8_17, human_8_18=uav_8_18, human_8_19=uav_8_19, human_8_20=uav_8_20, 
human_9_0=uav_9_0, human_9_1=uav_9_1, human_9_2=uav_9_2, human_9_3=uav_9_3, human_9_4=uav_9_4, human_9_5=uav_9_5, human_9_6=uav_9_6, human_9_7=uav_9_7, human_9_8=uav_9_8, human_9_9=uav_9_9, human_9_10=uav_9_10, human_9_11=uav_9_11, human_9_12=uav_9_12, human_9_13=uav_9_13, human_9_14=uav_9_14, human_9_15=uav_9_15, human_9_16=uav_9_16, human_9_17=uav_9_17, human_9_18=uav_9_18, human_9_19=uav_9_19, human_9_20=uav_9_20, 
human_10_0=uav_10_0, human_10_1=uav_10_1, human_10_2=uav_10_2, human_10_3=uav_10_3, human_10_4=uav_10_4, human_10_5=uav_10_5, human_10_6=uav_10_6, human_10_7=uav_10_7, human_10_8=uav_10_8, human_10_9=uav_10_9, human_10_10=uav_10_10, human_10_11=uav_10_11, human_10_12=uav_10_12, human_10_13=uav_10_13, human_10_14=uav_10_14, human_10_15=uav_10_15, human_10_16=uav_10_16, human_10_17=uav_10_17, human_10_18=uav_10_18, human_10_19=uav_10_19, human_10_20=uav_10_20, 
human_11_0=uav_11_0, human_11_1=uav_11_1, human_11_2=uav_11_2, human_11_3=uav_11_3, human_11_4=uav_11_4, human_11_5=uav_11_5, human_11_6=uav_11_6, human_11_7=uav_11_7, human_11_8=uav_11_8, human_11_9=uav_11_9, human_11_10=uav_11_10, human_11_11=uav_11_11, human_11_12=uav_11_12, human_11_13=uav_11_13, human_11_14=uav_11_14, human_11_15=uav_11_15, human_11_16=uav_11_16, human_11_17=uav_11_17, human_11_18=uav_11_18, human_11_19=uav_11_19, human_11_20=uav_11_20, 
human_12_0=uav_12_0, human_12_1=uav_12_1, human_12_2=uav_12_2, human_12_3=uav_12_3, human_12_4=uav_12_4, human_12_5=uav_12_5, human_12_6=uav_12_6, human_12_7=uav_12_7, human_12_8=uav_12_8, human_12_9=uav_12_9, human_12_10=uav_12_10, human_12_11=uav_12_11, human_12_12=uav_12_12, human_12_13=uav_12_13, human_12_14=uav_12_14, human_12_15=uav_12_15, human_12_16=uav_12_16, human_12_17=uav_12_17, human_12_18=uav_12_18, human_12_19=uav_12_19, human_12_20=uav_12_20, 
human_13_0=uav_13_0, human_13_1=uav_13_1, human_13_2=uav_13_2, human_13_3=uav_13_3, human_13_4=uav_13_4, human_13_5=uav_13_5, human_13_6=uav_13_6, human_13_7=uav_13_7, human_13_8=uav_13_8, human_13_9=uav_13_9, human_13_10=uav_13_10, human_13_11=uav_13_11, human_13_12=uav_13_12, human_13_13=uav_13_13, human_13_14=uav_13_14, human_13_15=uav_13_15, human_13_16=uav_13_16, human_13_17=uav_13_17, human_13_18=uav_13_18, human_13_19=uav_13_19, human_13_20=uav_13_20, 
human_14_0=uav_14_0, human_14_1=uav_14_1, human_14_2=uav_14_2, human_14_3=uav_14_3, human_14_4=uav_14_4, human_14_5=uav_14_5, human_14_6=uav_14_6, human_14_7=uav_14_7, human_14_8=uav_14_8, human_14_9=uav_14_9, human_14_10=uav_14_10, human_14_11=uav_14_11, human_14_12=uav_14_12, human_14_13=uav_14_13, human_14_14=uav_14_14, human_14_15=uav_14_15, human_14_16=uav_14_16, human_14_17=uav_14_17, human_14_18=uav_14_18, human_14_19=uav_14_19, human_14_20=uav_14_20, 
human_15_0=uav_15_0, human_15_1=uav_15_1, human_15_2=uav_15_2, human_15_3=uav_15_3, human_15_4=uav_15_4, human_15_5=uav_15_5, human_15_6=uav_15_6, human_15_7=uav_15_7, human_15_8=uav_15_8, human_15_9=uav_15_9, human_15_10=uav_15_10, human_15_11=uav_15_11, human_15_12=uav_15_12, human_15_13=uav_15_13, human_15_14=uav_15_14, human_15_15=uav_15_15, human_15_16=uav_15_16, human_15_17=uav_15_17, human_15_18=uav_15_18, human_15_19=uav_15_19, human_15_20=uav_15_20, 
human_16_0=uav_16_0, human_16_1=uav_16_1, human_16_2=uav_16_2, human_16_3=uav_16_3, human_16_4=uav_16_4, human_16_5=uav_16_5, human_16_6=uav_16_6, human_16_7=uav_16_7, human_16_8=uav_16_8, human_16_9=uav_16_9, human_16_10=uav_16_10, human_16_11=uav_16_11, human_16_12=uav_16_12, human_16_13=uav_16_13, human_16_14=uav_16_14, human_16_15=uav_16_15, human_16_16=uav_16_16, human_16_17=uav_16_17, human_16_18=uav_16_18, human_16_19=uav_16_19, human_16_20=uav_16_20, 
human_17_0=uav_17_0, human_17_1=uav_17_1, human_17_2=uav_17_2, human_17_3=uav_17_3, human_17_4=uav_17_4, human_17_5=uav_17_5, human_17_6=uav_17_6, human_17_7=uav_17_7, human_17_8=uav_17_8, human_17_9=uav_17_9, human_17_10=uav_17_10, human_17_11=uav_17_11, human_17_12=uav_17_12, human_17_13=uav_17_13, human_17_14=uav_17_14, human_17_15=uav_17_15, human_17_16=uav_17_16, human_17_17=uav_17_17, human_17_18=uav_17_18, human_17_19=uav_17_19, human_17_20=uav_17_20, 
human_18_0=uav_18_0, human_18_1=uav_18_1, human_18_2=uav_18_2, human_18_3=uav_18_3, human_18_4=uav_18_4, human_18_5=uav_18_5, human_18_6=uav_18_6, human_18_7=uav_18_7, human_18_8=uav_18_8, human_18_9=uav_18_9, human_18_10=uav_18_10, human_18_11=uav_18_11, human_18_12=uav_18_12, human_18_13=uav_18_13, human_18_14=uav_18_14, human_18_15=uav_18_15, human_18_16=uav_18_16, human_18_17=uav_18_17, human_18_18=uav_18_18, human_18_19=uav_18_19, human_18_20=uav_18_20, 
human_19_0=uav_19_0, human_19_1=uav_19_1, human_19_2=uav_19_2, human_19_3=uav_19_3, human_19_4=uav_19_4, human_19_5=uav_19_5, human_19_6=uav_19_6, human_19_7=uav_19_7, human_19_8=uav_19_8, human_19_9=uav_19_9, human_19_10=uav_19_10, human_19_11=uav_19_11, human_19_12=uav_19_12, human_19_13=uav_19_13, human_19_14=uav_19_14, human_19_15=uav_19_15, human_19_16=uav_19_16, human_19_17=uav_19_17, human_19_18=uav_19_18, human_19_19=uav_19_19, human_19_20=uav_19_20, 
human_20_0=uav_20_0, human_20_1=uav_20_1, human_20_2=uav_20_2, human_20_3=uav_20_3, human_20_4=uav_20_4, human_20_5=uav_20_5, human_20_6=uav_20_6, human_20_7=uav_20_7, human_20_8=uav_20_8, human_20_9=uav_20_9, human_20_10=uav_20_10, human_20_11=uav_20_11, human_20_12=uav_20_12, human_20_13=uav_20_13, human_20_14=uav_20_14, human_20_15=uav_20_15, human_20_16=uav_20_16, human_20_17=uav_20_17, human_20_18=uav_20_18, human_20_19=uav_20_19, human_20_20=uav_20_20]

endmodule

// ugv agent
module ugv = human [h=g, move_h=move_g,
human_0_0=ugv_0_0, human_0_1=ugv_0_1, human_0_2=ugv_0_2, human_0_3=ugv_0_3, human_0_4=ugv_0_4, human_0_5=ugv_0_5, human_0_6=ugv_0_6, human_0_7=ugv_0_7, human_0_8=ugv_0_8, human_0_9=ugv_0_9, human_0_10=ugv_0_10, human_0_11=ugv_0_11, human_0_12=ugv_0_12, human_0_13=ugv_0_13, human_0_14=ugv_0_14, human_0_15=ugv_0_15, human_0_16=ugv_0_16, human_0_17=ugv_0_17, human_0_18=ugv_0_18, human_0_19=ugv_0_19, human_0_20=ugv_0_20, 
human_1_0=ugv_1_0, human_1_1=ugv_1_1, human_1_2=ugv_1_2, human_1_3=ugv_1_3, human_1_4=ugv_1_4, human_1_5=ugv_1_5, human_1_6=ugv_1_6, human_1_7=ugv_1_7, human_1_8=ugv_1_8, human_1_9=ugv_1_9, human_1_10=ugv_1_10, human_1_11=ugv_1_11, human_1_12=ugv_1_12, human_1_13=ugv_1_13, human_1_14=ugv_1_14, human_1_15=ugv_1_15, human_1_16=ugv_1_16, human_1_17=ugv_1_17, human_1_18=ugv_1_18, human_1_19=ugv_1_19, human_1_20=ugv_1_20, 
human_2_0=ugv_2_0, human_2_1=ugv_2_1, human_2_2=ugv_2_2, human_2_3=ugv_2_3, human_2_4=ugv_2_4, human_2_5=ugv_2_5, human_2_6=ugv_2_6, human_2_7=ugv_2_7, human_2_8=ugv_2_8, human_2_9=ugv_2_9, human_2_10=ugv_2_10, human_2_11=ugv_2_11, human_2_12=ugv_2_12, human_2_13=ugv_2_13, human_2_14=ugv_2_14, human_2_15=ugv_2_15, human_2_16=ugv_2_16, human_2_17=ugv_2_17, human_2_18=ugv_2_18, human_2_19=ugv_2_19, human_2_20=ugv_2_20, 
human_3_0=ugv_3_0, human_3_1=ugv_3_1, human_3_2=ugv_3_2, human_3_3=ugv_3_3, human_3_4=ugv_3_4, human_3_5=ugv_3_5, human_3_6=ugv_3_6, human_3_7=ugv_3_7, human_3_8=ugv_3_8, human_3_9=ugv_3_9, human_3_10=ugv_3_10, human_3_11=ugv_3_11, human_3_12=ugv_3_12, human_3_13=ugv_3_13, human_3_14=ugv_3_14, human_3_15=ugv_3_15, human_3_16=ugv_3_16, human_3_17=ugv_3_17, human_3_18=ugv_3_18, human_3_19=ugv_3_19, human_3_20=ugv_3_20, 
human_4_0=ugv_4_0, human_4_1=ugv_4_1, human_4_2=ugv_4_2, human_4_3=ugv_4_3, human_4_4=ugv_4_4, human_4_5=ugv_4_5, human_4_6=ugv_4_6, human_4_7=ugv_4_7, human_4_8=ugv_4_8, human_4_9=ugv_4_9, human_4_10=ugv_4_10, human_4_11=ugv_4_11, human_4_12=ugv_4_12, human_4_13=ugv_4_13, human_4_14=ugv_4_14, human_4_15=ugv_4_15, human_4_16=ugv_4_16, human_4_17=ugv_4_17, human_4_18=ugv_4_18, human_4_19=ugv_4_19, human_4_20=ugv_4_20, 
human_5_0=ugv_5_0, human_5_1=ugv_5_1, human_5_2=ugv_5_2, human_5_3=ugv_5_3, human_5_4=ugv_5_4, human_5_5=ugv_5_5, human_5_6=ugv_5_6, human_5_7=ugv_5_7, human_5_8=ugv_5_8, human_5_9=ugv_5_9, human_5_10=ugv_5_10, human_5_11=ugv_5_11, human_5_12=ugv_5_12, human_5_13=ugv_5_13, human_5_14=ugv_5_14, human_5_15=ugv_5_15, human_5_16=ugv_5_16, human_5_17=ugv_5_17, human_5_18=ugv_5_18, human_5_19=ugv_5_19, human_5_20=ugv_5_20, 
human_6_0=ugv_6_0, human_6_1=ugv_6_1, human_6_2=ugv_6_2, human_6_3=ugv_6_3, human_6_4=ugv_6_4, human_6_5=ugv_6_5, human_6_6=ugv_6_6, human_6_7=ugv_6_7, human_6_8=ugv_6_8, human_6_9=ugv_6_9, human_6_10=ugv_6_10, human_6_11=ugv_6_11, human_6_12=ugv_6_12, human_6_13=ugv_6_13, human_6_14=ugv_6_14, human_6_15=ugv_6_15, human_6_16=ugv_6_16, human_6_17=ugv_6_17, human_6_18=ugv_6_18, human_6_19=ugv_6_19, human_6_20=ugv_6_20, 
human_7_0=ugv_7_0, human_7_1=ugv_7_1, human_7_2=ugv_7_2, human_7_3=ugv_7_3, human_7_4=ugv_7_4, human_7_5=ugv_7_5, human_7_6=ugv_7_6, human_7_7=ugv_7_7, human_7_8=ugv_7_8, human_7_9=ugv_7_9, human_7_10=ugv_7_10, human_7_11=ugv_7_11, human_7_12=ugv_7_12, human_7_13=ugv_7_13, human_7_14=ugv_7_14, human_7_15=ugv_7_15, human_7_16=ugv_7_16, human_7_17=ugv_7_17, human_7_18=ugv_7_18, human_7_19=ugv_7_19, human_7_20=ugv_7_20, 
human_8_0=ugv_8_0, human_8_1=ugv_8_1, human_8_2=ugv_8_2, human_8_3=ugv_8_3, human_8_4=ugv_8_4, human_8_5=ugv_8_5, human_8_6=ugv_8_6, human_8_7=ugv_8_7, human_8_8=ugv_8_8, human_8_9=ugv_8_9, human_8_10=ugv_8_10, human_8_11=ugv_8_11, human_8_12=ugv_8_12, human_8_13=ugv_8_13, human_8_14=ugv_8_14, human_8_15=ugv_8_15, human_8_16=ugv_8_16, human_8_17=ugv_8_17, human_8_18=ugv_8_18, human_8_19=ugv_8_19, human_8_20=ugv_8_20, 
human_9_0=ugv_9_0, human_9_1=ugv_9_1, human_9_2=ugv_9_2, human_9_3=ugv_9_3, human_9_4=ugv_9_4, human_9_5=ugv_9_5, human_9_6=ugv_9_6, human_9_7=ugv_9_7, human_9_8=ugv_9_8, human_9_9=ugv_9_9, human_9_10=ugv_9_10, human_9_11=ugv_9_11, human_9_12=ugv_9_12, human_9_13=ugv_9_13, human_9_14=ugv_9_14, human_9_15=ugv_9_15, human_9_16=ugv_9_16, human_9_17=ugv_9_17, human_9_18=ugv_9_18, human_9_19=ugv_9_19, human_9_20=ugv_9_20, 
human_10_0=ugv_10_0, human_10_1=ugv_10_1, human_10_2=ugv_10_2, human_10_3=ugv_10_3, human_10_4=ugv_10_4, human_10_5=ugv_10_5, human_10_6=ugv_10_6, human_10_7=ugv_10_7, human_10_8=ugv_10_8, human_10_9=ugv_10_9, human_10_10=ugv_10_10, human_10_11=ugv_10_11, human_10_12=ugv_10_12, human_10_13=ugv_10_13, human_10_14=ugv_10_14, human_10_15=ugv_10_15, human_10_16=ugv_10_16, human_10_17=ugv_10_17, human_10_18=ugv_10_18, human_10_19=ugv_10_19, human_10_20=ugv_10_20, 
human_11_0=ugv_11_0, human_11_1=ugv_11_1, human_11_2=ugv_11_2, human_11_3=ugv_11_3, human_11_4=ugv_11_4, human_11_5=ugv_11_5, human_11_6=ugv_11_6, human_11_7=ugv_11_7, human_11_8=ugv_11_8, human_11_9=ugv_11_9, human_11_10=ugv_11_10, human_11_11=ugv_11_11, human_11_12=ugv_11_12, human_11_13=ugv_11_13, human_11_14=ugv_11_14, human_11_15=ugv_11_15, human_11_16=ugv_11_16, human_11_17=ugv_11_17, human_11_18=ugv_11_18, human_11_19=ugv_11_19, human_11_20=ugv_11_20, 
human_12_0=ugv_12_0, human_12_1=ugv_12_1, human_12_2=ugv_12_2, human_12_3=ugv_12_3, human_12_4=ugv_12_4, human_12_5=ugv_12_5, human_12_6=ugv_12_6, human_12_7=ugv_12_7, human_12_8=ugv_12_8, human_12_9=ugv_12_9, human_12_10=ugv_12_10, human_12_11=ugv_12_11, human_12_12=ugv_12_12, human_12_13=ugv_12_13, human_12_14=ugv_12_14, human_12_15=ugv_12_15, human_12_16=ugv_12_16, human_12_17=ugv_12_17, human_12_18=ugv_12_18, human_12_19=ugv_12_19, human_12_20=ugv_12_20, 
human_13_0=ugv_13_0, human_13_1=ugv_13_1, human_13_2=ugv_13_2, human_13_3=ugv_13_3, human_13_4=ugv_13_4, human_13_5=ugv_13_5, human_13_6=ugv_13_6, human_13_7=ugv_13_7, human_13_8=ugv_13_8, human_13_9=ugv_13_9, human_13_10=ugv_13_10, human_13_11=ugv_13_11, human_13_12=ugv_13_12, human_13_13=ugv_13_13, human_13_14=ugv_13_14, human_13_15=ugv_13_15, human_13_16=ugv_13_16, human_13_17=ugv_13_17, human_13_18=ugv_13_18, human_13_19=ugv_13_19, human_13_20=ugv_13_20, 
human_14_0=ugv_14_0, human_14_1=ugv_14_1, human_14_2=ugv_14_2, human_14_3=ugv_14_3, human_14_4=ugv_14_4, human_14_5=ugv_14_5, human_14_6=ugv_14_6, human_14_7=ugv_14_7, human_14_8=ugv_14_8, human_14_9=ugv_14_9, human_14_10=ugv_14_10, human_14_11=ugv_14_11, human_14_12=ugv_14_12, human_14_13=ugv_14_13, human_14_14=ugv_14_14, human_14_15=ugv_14_15, human_14_16=ugv_14_16, human_14_17=ugv_14_17, human_14_18=ugv_14_18, human_14_19=ugv_14_19, human_14_20=ugv_14_20, 
human_15_0=ugv_15_0, human_15_1=ugv_15_1, human_15_2=ugv_15_2, human_15_3=ugv_15_3, human_15_4=ugv_15_4, human_15_5=ugv_15_5, human_15_6=ugv_15_6, human_15_7=ugv_15_7, human_15_8=ugv_15_8, human_15_9=ugv_15_9, human_15_10=ugv_15_10, human_15_11=ugv_15_11, human_15_12=ugv_15_12, human_15_13=ugv_15_13, human_15_14=ugv_15_14, human_15_15=ugv_15_15, human_15_16=ugv_15_16, human_15_17=ugv_15_17, human_15_18=ugv_15_18, human_15_19=ugv_15_19, human_15_20=ugv_15_20, 
human_16_0=ugv_16_0, human_16_1=ugv_16_1, human_16_2=ugv_16_2, human_16_3=ugv_16_3, human_16_4=ugv_16_4, human_16_5=ugv_16_5, human_16_6=ugv_16_6, human_16_7=ugv_16_7, human_16_8=ugv_16_8, human_16_9=ugv_16_9, human_16_10=ugv_16_10, human_16_11=ugv_16_11, human_16_12=ugv_16_12, human_16_13=ugv_16_13, human_16_14=ugv_16_14, human_16_15=ugv_16_15, human_16_16=ugv_16_16, human_16_17=ugv_16_17, human_16_18=ugv_16_18, human_16_19=ugv_16_19, human_16_20=ugv_16_20, 
human_17_0=ugv_17_0, human_17_1=ugv_17_1, human_17_2=ugv_17_2, human_17_3=ugv_17_3, human_17_4=ugv_17_4, human_17_5=ugv_17_5, human_17_6=ugv_17_6, human_17_7=ugv_17_7, human_17_8=ugv_17_8, human_17_9=ugv_17_9, human_17_10=ugv_17_10, human_17_11=ugv_17_11, human_17_12=ugv_17_12, human_17_13=ugv_17_13, human_17_14=ugv_17_14, human_17_15=ugv_17_15, human_17_16=ugv_17_16, human_17_17=ugv_17_17, human_17_18=ugv_17_18, human_17_19=ugv_17_19, human_17_20=ugv_17_20, 
human_18_0=ugv_18_0, human_18_1=ugv_18_1, human_18_2=ugv_18_2, human_18_3=ugv_18_3, human_18_4=ugv_18_4, human_18_5=ugv_18_5, human_18_6=ugv_18_6, human_18_7=ugv_18_7, human_18_8=ugv_18_8, human_18_9=ugv_18_9, human_18_10=ugv_18_10, human_18_11=ugv_18_11, human_18_12=ugv_18_12, human_18_13=ugv_18_13, human_18_14=ugv_18_14, human_18_15=ugv_18_15, human_18_16=ugv_18_16, human_18_17=ugv_18_17, human_18_18=ugv_18_18, human_18_19=ugv_18_19, human_18_20=ugv_18_20, 
human_19_0=ugv_19_0, human_19_1=ugv_19_1, human_19_2=ugv_19_2, human_19_3=ugv_19_3, human_19_4=ugv_19_4, human_19_5=ugv_19_5, human_19_6=ugv_19_6, human_19_7=ugv_19_7, human_19_8=ugv_19_8, human_19_9=ugv_19_9, human_19_10=ugv_19_10, human_19_11=ugv_19_11, human_19_12=ugv_19_12, human_19_13=ugv_19_13, human_19_14=ugv_19_14, human_19_15=ugv_19_15, human_19_16=ugv_19_16, human_19_17=ugv_19_17, human_19_18=ugv_19_18, human_19_19=ugv_19_19, human_19_20=ugv_19_20, 
human_20_0=ugv_20_0, human_20_1=ugv_20_1, human_20_2=ugv_20_2, human_20_3=ugv_20_3, human_20_4=ugv_20_4, human_20_5=ugv_20_5, human_20_6=ugv_20_6, human_20_7=ugv_20_7, human_20_8=ugv_20_8, human_20_9=ugv_20_9, human_20_10=ugv_20_10, human_20_11=ugv_20_11, human_20_12=ugv_20_12, human_20_13=ugv_20_13, human_20_14=ugv_20_14, human_20_15=ugv_20_15, human_20_16=ugv_20_16, human_20_17=ugv_20_17, human_20_18=ugv_20_18, human_20_19=ugv_20_19, human_20_20=ugv_20_20]
endmodule

// main site module
module site_one
	s1: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)

	[] s1=state0 & ((h=site1 & !move_h) | (a=site1 & !move_a) | (g=site1 & !move_g))	-> 0.25:(s1'=state1) + 0.25:(s1'=state2) + 0.25:(s1'=state3) + 0.25:(s1'=state4);
	[] s1=state1 & (h=site1 & !move_h)  & (g=site1 & !move_g)				-> 0.50:(s1'=state1) + 0.50:(s1'=state4);
	[] s1=state2 & (h=site1 & !move_h)							-> 0.50:(s1'=state2) + 0.50:(s1'=state4);
	[] s1=state3 & (h=site1 & !move_h) & (g=site1 & !move_g)				-> 0.25:(s1'=state1) + 0.25:(s1'=state2) + 0.25:(s1'=state3) + 0.25:(s1'=state4);
	[] s1=state3 & (h=site1 & !move_h) & g!=site1						-> 0.50:(s1'=state1) + 0.50:(s1'=state3);
	[] s1=state4										-> true; // self-loop
	
	[end] totClock>totClock_max-1 -> (s1'=state4);
endmodule 

// duplicate site modules
module site_0 = site_one[s1=s0, site1=site0] endmodule
module site_1 = site_one[s1=s1, site1=site1] endmodule
module site_2 = site_one[s1=s2, site1=site2] endmodule
module site_3 = site_one[s1=s3, site1=site3] endmodule
module site_4 = site_one[s1=s4, site1=site4] endmodule
module site_5 = site_one[s1=s5, site1=site5] endmodule
module site_6 = site_one[s1=s6, site1=site6] endmodule
module site_7 = site_one[s1=s7, site1=site7] endmodule
module site_8 = site_one[s1=s8, site1=site8] endmodule
module site_9 = site_one[s1=s9, site1=site9] endmodule
module site_10 = site_one[s1=s10, site1=site10] endmodule
module site_11 = site_one[s1=s11, site1=site11] endmodule
module site_12 = site_one[s1=s12, site1=site12] endmodule
module site_13 = site_one[s1=s13, site1=site13] endmodule
module site_14 = site_one[s1=s14, site1=site14] endmodule
module site_15 = site_one[s1=s15, site1=site15] endmodule
module site_16 = site_one[s1=s16, site1=site16] endmodule
module site_17 = site_one[s1=s17, site1=site17] endmodule
module site_18 = site_one[s1=s18, site1=site18] endmodule
module site_19 = site_one[s1=s19, site1=site19] endmodule
module site_20 = site_one[s1=s20, site1=site20] endmodule

// counter for time
rewards "time"
	[time]true : 1;
endrewards

// finish state
label "done" = s0=4 & s1=4 & s2=4 & s3=4 & s4=4 & s5=4 & s6=4 & s7=4 & s8=4 & s9=4 & s10=4 & s11=4 & s12=4 & s13=4 & s14=4 & s15=4 & s16=4 & s17=4 & s18=4 & s19=4 & s20=4;

