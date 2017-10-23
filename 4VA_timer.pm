mdp

// TIMING CONSTANTS
const int Ch_MAX = 20; // max vlaue of clock_h
const int Ca_MAX = 20; // max vlaue of clock_a
const int Cg_MAX = 20; // max vlaue of clock_g

// DISTANCE CONSTANTS
const int D01 = 2; // distance between site0 and site1
const int D02 = 3; // distance between site0 and site2
const int D12 = 4; // distance between site1 and site2

// SPEED CONSTANTS
const int Sh = 3; // human travel speed (time/distance)
const int Sa = 1; // UVA travel speed (time/distance)
const int Sg = 2; // UGV travel speed (time/distance)

// SITE INFORMATION
const int N = 2; // number of sites
const int site0 = 0;
const int site1 = 1;
const int site2 = 2;


// main agent module
module human

	h: [0..N] init 0; // human position
	clock_h: [0..Ch_MAX] init 0; // clock of human
	move_h: bool init false; // human in the move

	// time passage
	[time] clock_h>1 -> (clock_h'=clock_h-1);
	[time] clock_h=1 -> (clock_h'=0) & (move_h'=false);

	// human movement between sites
	[human_0_1] h=site0 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D01*Sh) & (move_h'=true);
	[human_0_2] h=site0 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D02*Sh) & (move_h'=true);
	[human_1_2] h=site1 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D12*Sh) & (move_h'=true);
	[human_1_0] h=site1 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D01*Sh) & (move_h'=true);
	[human_2_1] h=site2 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D12*Sh) & (move_h'=true);
	[human_2_0] h=site2 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D02*Sh) & (move_h'=true);

	// human stays at the same site
	[] clock_h=0 & !move_h -> (clock_h'=1);
	
endmodule

// uav agent
module uav = human [h=a, clock_h=clock_a, move_h=move_a, Ch_MAX=Ca_MAX, Sh=Sa, 
			human_0_1=uav_0_1, human_0_2=uav_0_2, human_1_2=uav_1_2, 
			human_1_0=uav_1_0, human_2_0=uav_2_0, human_2_1=uav_2_1]
endmodule

// ugv agent
module ugv = human [h=g, clock_h=clock_g, move_h=move_g, Ch_MAX=Cg_MAX, Sh=Sg, 
			human_0_1=ugv_0_1, human_0_2=ugv_0_2, human_1_2=ugv_1_2, 
			human_1_0=ugv_1_0, human_2_0=ugv_2_0, human_2_1=ugv_2_1]
endmodule

// main site module
module site_one

	s1: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)

	[] s1=0 & ((h=site1 & !move_h) | (a=site1 & !move_a) | (g=site1 & !move_g)) -> 0.25:(s1'=1) + 0.25:(s1'=2) + 0.25:(s1'=3) + 0.25:(s1'=4);
	[] s1=1 & (h=site1 & !move_h)  & (g=site1 & !move_g) -> 0.5:(s1'=1) + 0.5:(s1'=4);
	[] s1=2 & (h=site1 & !move_h) -> 0.5:(s1'=2) + 0.5:(s1'=4);
	[] s1=3 & (h=site1 & !move_h) & (g=site1 & !move_g) -> 0.25:(s1'=1) + 0.25:(s1'=2) + 0.25:(s1'=3) + 0.25:(s1'=4);
	[] s1=3 & (h=site1 & !move_h) & g!=site1 -> 0.5:(s1'=1) + 0.5:(s1'=3);
	[] s1=4 -> true; // self-loop

endmodule 

// duplicate site modules
module site_two = site_one [s1=s2, site1=site2] endmodule

// counter for time
rewards
	[time]true : 1;
endrewards

// finish state
label "done" = s1=4 & s2=4;

