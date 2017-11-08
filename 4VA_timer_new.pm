mdp

// DISTANCE CONSTANTS
const int D01 = 2; // distance between site0 and site1
const int D02 = 3; // distance between site0 and site2
const int D12 = 4; // distance between site1 and site2

// SITES
const int N = 2; // number of sites
const int site0 = 0;
const int site1 = 1;
const int site2 = 2;

// TIMING CONSTANTS
const int Ch_MAX = 100; // max vlaue of clock_h
const int Ca_MAX = 100; // max vlaue of clock_a
const int Cg_MAX = 100; // max vlaue of clock_g
//global totTime: int init 0;

// SPEED CONSTANTS
const int Sh = 3; // human travel speed (time/distance)
const int Sa = 1; // UVA travel speed (time/distance)
const int Sg = 2; // UGV travel speed (time/distance)

// SITE INFORMATION
const int state0 = 0; // unknown
const int state1 = 1; // fire
const int state2 = 2; // human
const int state3 = 3; // fire+human
const int state4 = 4; // nuteral

//module time
//	totTime: [0..20] init 0;
//	timeMovement: bool init false;
//
//	[time] true -> (timeMovement'=true);
//	[] timeMovement=true & totTime>-1 & totTime<20 -> (totTime'=totTime+1) & (timeMovement'=false);
//endmodule

// main agent module
//TODO: NEED TO ADD GLOBAL TIME OR REFERENCE REWARD FUNCTION
module human
	h: [0..N] init 0; // position of human (which site the agent is at)
	clock_h: [0..Ch_MAX] init 0; // clock of human (transition time needed for the agent)
//	clock_h: int init 0;
	move_h: bool init false; // human moving (lock for agent movement)

	// time passage
	[time] clock_h>totTime+1 -> true; // if agent is moving
	[time] clock_h=totTime+1 -> (clock_h'=0) & (move_h'=false); // agent has stopped moving

	// human stays at the same site
	[] clock_h=0 & !move_h -> (clock_h'=totTime+1);

	// human movement between sites
	[human_0_1] h=site0 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D01*Sh+totTime) & (move_h'=true);
	[human_0_2] h=site0 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D02*Sh+totTime) & (move_h'=true);
	[human_1_0] h=site1 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D01*Sh+totTime) & (move_h'=true);
	[human_1_2] h=site1 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D12*Sh+totTime) & (move_h'=true);
	[human_2_0] h=site2 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D02*Sh+totTime) & (move_h'=true);
	[human_2_1] h=site2 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D12*Sh+totTime) & (move_h'=true);
endmodule

// uav agent
module uav = human [h=a, clock_h=clock_a, move_h=move_a, Ch_MAX=Ca_MAX, Sh=Sa, 
			human_0_1=uav_0_1, human_0_2=uav_0_2, human_1_0=uav_1_0, human_1_2=uav_1_2,
			human_2_0=uav_2_0, human_2_1=uav_2_1]
endmodule

// ugv agent
module ugv = human [h=g, clock_h=clock_g, move_h=move_g, Ch_MAX=Cg_MAX, Sh=Sg,
			human_0_1=ugv_0_1, human_0_2=ugv_0_2, human_1_0=ugv_1_0, human_1_2=ugv_1_2,
			human_2_0=ugv_2_0, human_2_1=ugv_2_1]
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
endmodule 

// duplicate site modules
module site_two = site_one[s1=s2, site1=site2] endmodule

// counter for time
//rewards "time"
//	[time]true : 1;
//endrewards

module globalTime
	totTime: int init 0;
	[time] s1!=4 & s2!=4 -> (totTime' = totTime+1);
endmodule

// finish state
label "done" = s1=4 & s2=4; //& s3=4;  & s4=4 & s5=4 & s6=4;

