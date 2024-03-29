mdp
// most basic implementation

// DISTANCE CONSTANTS
const int D01 = 2; // distance between site0 and site1
const int D02 = 3; // distance between site0 and site2
//const int D03 = 2;
//const int D04 = 4;
//const int D05 = 3;
//const int D06 = 4;

const int D12 = 4; // distance between site1 and site2
//const int D13 = 3;
//const int D14 = 3;
//const int D15 = 2;
//const int D16 = 4;
//const int D23 = 2;
//const int D24 = 3;
//const int D25 = 3;
//const int D26 = 2;
//const int D34 = 4;
//const int D35 = 2;
//const int D36 = 3; 
//const int D45 = 3;
//const int D46 = 4;
//const int D56 = 2;

// SITES
const int N = 2; // number of sites
const int site0 = 0;
const int site1 = 1;
const int site2 = 2;
//const int site3 = 3;
//const int site4 = 4;
//const int site5 = 5;
//const int site6 = 6;

// TIMING CONSTANTS
const int Ch_MAX = 20; // max vlaue of clock_h
const int Ca_MAX = 20; // max vlaue of clock_a
const int Cg_MAX = 20; // max vlaue of clock_g

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


// main agent module
module human
	h: [0..N] init 0; // position of human (which site the agent is at)
	clock_h: [0..Ch_MAX] init 0; // clock of human (transition time needed for the agent)
//	clock_h: int init 0;
	move_h: bool init false; // human moving (lock for agent movement)

	// time passage
	[time] clock_h>1 -> (clock_h'=clock_h-1); // if agent is moving
	[time] clock_h=1 -> (clock_h'=0) & (move_h'=false); // agent has stopped moving

	// human stays at the same site
	[] clock_h=0 & !move_h -> (clock_h'=1);

	// human movement between sites
	[human_0_1] h=site0 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D01*Sh) & (move_h'=true);
	[human_0_2] h=site0 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D02*Sh) & (move_h'=true);
//	[human_0_3] h=site0 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D03*Sh) & (move_h'=true);
//	[human_0_4] h=site0 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D04*Sh) & (move_h'=true);
//	[human_0_5] h=site0 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D05*Sh) & (move_h'=true);
//	[human_0_6] h=site0 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D06*Sh) & (move_h'=true);

	[human_1_0] h=site1 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D01*Sh) & (move_h'=true);
	[human_1_2] h=site1 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D12*Sh) & (move_h'=true);
//	[human_1_3] h=site1 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D13*Sh) & (move_h'=true);
//	[human_1_4] h=site1 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D14*Sh) & (move_h'=true);
//	[human_1_5] h=site1 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D15*Sh) & (move_h'=true);
//	[human_1_6] h=site1 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D16*Sh) & (move_h'=true);

	[human_2_0] h=site2 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D02*Sh) & (move_h'=true);
	[human_2_1] h=site2 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D12*Sh) & (move_h'=true);
//	[human_2_3] h=site2 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D23*Sh) & (move_h'=true);
//	[human_2_4] h=site2 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D24*Sh) & (move_h'=true);
//	[human_2_5] h=site2 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D25*Sh) & (move_h'=true);
//	[human_2_6] h=site2 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D26*Sh) & (move_h'=true);

//	[human_3_0] h=site3 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D03*Sh) & (move_h'=true);
//	[human_3_1] h=site3 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D13*Sh) & (move_h'=true);
//	[human_3_2] h=site3 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D23*Sh) & (move_h'=true);
//	[human_3_4] h=site3 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D34*Sh) & (move_h'=true);
//	[human_3_5] h=site3 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D35*Sh) & (move_h'=true);
//	[human_3_6] h=site3 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D36*Sh) & (move_h'=true);

//	[human_4_0] h=site4 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D04*Sh) & (move_h'=true);
//	[human_4_1] h=site4 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D14*Sh) & (move_h'=true);
//	[human_4_2] h=site4 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D24*Sh) & (move_h'=true);
//	[human_4_3] h=site4 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D34*Sh) & (move_h'=true);
//	[human_4_5] h=site4 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D45*Sh) & (move_h'=true);
//	[human_4_6] h=site4 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D46*Sh) & (move_h'=true);

//	[human_5_0] h=site5 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D05*Sh) & (move_h'=true);
//	[human_5_1] h=site5 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D15*Sh) & (move_h'=true);
//	[human_5_2] h=site5 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D25*Sh) & (move_h'=true);
//	[human_5_3] h=site5 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D35*Sh) & (move_h'=true);
//	[human_5_4] h=site5 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D45*Sh) & (move_h'=true);
//	[human_5_6] h=site5 & clock_h=0 & !move_h -> (h'=site6) & (clock_h'=D46*Sh) & (move_h'=true);

//	[human_6_0] h=site6 & clock_h=0 & !move_h -> (h'=site0) & (clock_h'=D06*Sh) & (move_h'=true);
//	[human_6_1] h=site6 & clock_h=0 & !move_h -> (h'=site1) & (clock_h'=D16*Sh) & (move_h'=true);
//	[human_6_2] h=site6 & clock_h=0 & !move_h -> (h'=site2) & (clock_h'=D26*Sh) & (move_h'=true);
//	[human_6_3] h=site6 & clock_h=0 & !move_h -> (h'=site3) & (clock_h'=D36*Sh) & (move_h'=true);
//	[human_6_4] h=site6 & clock_h=0 & !move_h -> (h'=site4) & (clock_h'=D46*Sh) & (move_h'=true);
//	[human_6_5] h=site6 & clock_h=0 & !move_h -> (h'=site5) & (clock_h'=D56*Sh) & (move_h'=true);
endmodule

// uav agent
module uav = human [h=a, clock_h=clock_a, move_h=move_a, Ch_MAX=Ca_MAX, Sh=Sa, 
			human_0_1=uav_0_1, human_0_2=uav_0_2, human_0_3=uav_0_3, human_0_4=uav_0_4, human_0_5=uav_0_5, human_0_6=uav_0_6, human_1_0=uav_1_0, human_1_2=uav_1_2, human_1_3=uav_1_3, human_1_4=uav_1_4, human_1_5=uav_1_5, human_1_6=uav_1_6,
			human_2_0=uav_2_0, human_2_1=uav_2_1, human_2_3=uav_2_3, human_2_4=uav_2_4, human_2_5=uav_2_5, human_2_6=uav_2_6, human_3_0=uav_3_0, human_3_1=uav_3_1, human_3_2=uav_3_2, human_3_4=uav_3_4, human_3_5=uav_3_5, human_3_6=uav_3_6,
			human_4_0=uav_4_0, human_4_1=uav_4_1, human_4_2=uav_4_2, human_4_3=uav_4_3, human_4_5=uav_4_5, human_4_6=uav_4_6, human_5_0=uav_5_0, human_5_1=uav_5_1, human_5_2=uav_5_2, human_5_3=uav_5_3, human_5_4=uav_5_4, human_5_6=uav_5_6,
			human_6_0=uav_6_0, human_6_1=uav_6_1, human_6_2=uav_6_2, human_6_3=uav_6_3, human_6_4=uav_6_4, human_6_5=uav_6_5]
endmodule

// ugv agent
module ugv = human [h=g, clock_h=clock_g, move_h=move_g, Ch_MAX=Cg_MAX, Sh=Sg,
			human_0_1=ugv_0_1, human_0_2=ugv_0_2, human_0_3=ugv_0_3, human_0_4=ugv_0_4, human_0_5=ugv_0_5, human_0_6=ugv_0_6, human_1_0=ugv_1_0, human_1_2=ugv_1_2, human_1_3=ugv_1_3, human_1_4=ugv_1_4, human_1_5=ugv_1_5, human_1_6=ugv_1_6,
			human_2_0=ugv_2_0, human_2_1=ugv_2_1, human_2_3=ugv_2_3, human_2_4=ugv_2_4, human_2_5=ugv_2_5, human_2_6=ugv_2_6, human_3_0=ugv_3_0, human_3_1=ugv_3_1, human_3_2=ugv_3_2, human_3_4=ugv_3_4, human_3_5=ugv_3_5, human_3_6=ugv_3_6,
			human_4_0=ugv_4_0, human_4_1=ugv_4_1, human_4_2=ugv_4_2, human_4_3=ugv_4_3, human_4_5=ugv_4_5, human_4_6=ugv_4_6, human_5_0=ugv_5_0, human_5_1=ugv_5_1, human_5_2=ugv_5_2, human_5_3=ugv_5_3, human_5_4=ugv_5_4, human_5_6=ugv_5_6,
			human_6_0=ugv_6_0, human_6_1=ugv_6_1, human_6_2=ugv_6_2, human_6_3=ugv_6_3, human_6_4=ugv_6_4, human_6_5=ugv_6_5]
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
//module site_three = site_one[s1=s3, site1=site3] endmodule
//module site_four = site_one[s1=s4, site1=site4] endmodule
//module site_five = site_one[s1=s5, site1=site5] endmodule
//module site_six = site_one[s1=s6, site1=site6] endmodule

// counter for time
rewards "time"
	[time]true : 1;
endrewards

// finish state
label "done" = s1=4 & s2=4;// & s3=4 & s4=4 & s5=4 & s6=4;

