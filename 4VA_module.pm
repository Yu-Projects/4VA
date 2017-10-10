mdp

//TODO: try controller synthesis to optimize properties (including pareto properties)
//TODO: scale up the number of humans, robots, sites
//TODO: how do you allow for sites to do both change at the same time without doing an exhaustive creation of lines
//NOTE: when simulating you should only click an agents path once per time step. This is due to the fact you will be doing redundant steps if you click an agents movement multiple times in one time step

const int num_sites=2;
global agent : [0..1] init 0;
global s1: [0..4] init 0;			//state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
global s2: [0..4] init 0; 			//state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)

//time=0;

module Human
	h: [0..num_sites] init 0; // human position

	[] agent=0 & h=0 -> (h'=0);
	[] agent=0 & h=0 -> (h'=1);
	[s1_hg] agent=0 & h=0 -> (h'=1);
	[s1_h] agent=0 & h=0 -> (h'=1);
	[] agent=0 & h=0 -> (h'=2);
	[s2_hg] agent=0 & h=0 -> (h'=2);
	[s2_h] agent=0 & h=0 -> (h'=2);

	[] agent=0 & h=1 -> (h'=0);
	[] agent=0 & h=1 -> (h'=1);
	[s1_hg] agent=0 & h=1 -> (h'=1);
	[s1_h] agent=0 & h=1 -> (h'=1);
	[] agent=0 & h=1 -> (h'=2);
	[s2_hg] agent=0 & h=1 -> (h'=2);
	[s2_h] agent=0 & h=1 -> (h'=2);

	[] agent=0 & h=2 -> (h'=0);
	[] agent=0 & h=2 -> (h'=1);
	[s1_hg] agent=0 & h=2 -> (h'=1);
	[s1_h] agent=0 & h=2 -> (h'=1);
	[] agent=0 & h=2 -> (h'=2);
	[s2_hg] agent=0 & h=2 -> (h'=2);
	[s2_h] agent=0 & h=2 -> (h'=2);
endmodule

module UGV
	g: [0..num_sites] init 0; // ugv position

	[] agent=0 & g=0 -> (g'=0);
	[] agent=0 & g=0 -> (g'=1);
	[s1_hg] agent=0 & g=0 -> (g'=1);
	[] agent=0 & g=0 -> (g'=2);
	[s2_hg] agent=0 & g=0 -> (g'=2);

	[] agent=0 & g=1 -> (g'=0);
	[] agent=0 & g=1 -> (g'=1);
	[s1_hg] agent=0 & g=1 -> (g'=1);
	[] agent=0 & g=1 -> (g'=2);
	[s2_hg] agent=0 & g=1 -> (g'=2);

	[] agent=0 & g=2 -> (g'=0);
	[] agent=0 & g=2 -> (g'=1);
	[s1_hg] agent=0 & g=2 -> (g'=1);
	[] agent=0 & g=2 -> (g'=2);
	[s2_hg] agent=0 & g=2 -> (g'=2);
endmodule

module UAV
	a: [0..num_sites] init 0; // uav position

	[] agent=0 & a=0 -> (a'=0);
	[] agent=0 & a=0 -> (a'=1);
	[] agent=0 & a=0 -> (a'=2);

	[] agent=0 & a=1 -> (a'=0);
	[] agent=0 & a=1 -> (a'=1);
	[] agent=0 & a=1 -> (a'=2);

	[] agent=0 & a=2 -> (a'=0);
	[] agent=0 & a=2 -> (a'=1);
	[] agent=0 & a=2 -> (a'=2);
endmodule

module sites
	s1t: [0..1] init 0;
	s2t: [0..1] init 0;
	time: [0..100] init 0;	//reward variable for keeping track of time

	//site1
	[] s1t=0 & s1=0 & (h=1 | a=1 | g=1) -> 0.25:(s1'=1) & (s1t'=1) & (agent'=1) + 0.25:(s1'=2) & (s1t'=1) & (agent'=1) + 0.25:(s1'=3) & (s1t'=1) & (agent'=1) + 0.25:(s1'=4) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=1 & h=1 & g=1 -> 0.5:(s1'=1) & (s1t'=1) & (agent'=1) + 0.5:(s1'=4) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=2 & h=1 -> 0.5:(s1'=2) & (s1t'=1) & (agent'=1) + 0.5:(s1'=4) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=3 & h=1 & g=1 -> 0.25:(s1'=1) & (s1t'=1) & (agent'=1) + 0.25:(s1'=2) & (s1t'=1) & (agent'=1) + 0.25:(s1'=3) & (s1t'=1) & (agent'=1) + 0.25:(s1'=4) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=3 & h=1 -> 0.5:(s1'=1) & (s1t'=1) & (agent'=1) + 0.5:(s1'=3) & (s1t'=1) & (agent'=1);
	//site2
	[] s2t=0 & s2=0 & (h=2 | a=2 | g=2) -> 0.25:(s2'=1) & (s2t'=1) & (agent'=1) + 0.25:(s2'=2) & (s2t'=1) & (agent'=1) + 0.25:(s2'=3) & (s2t'=1) & (agent'=1) + 0.25:(s2'=4) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=1 & h=2 & g=2 -> 0.5:(s2'=1) & (s2t'=1) & (agent'=1) + 0.5:(s2'=4) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=2 & h=2 -> 0.5:(s2'=2) & (s2t'=1) & (agent'=1) + 0.5:(s2'=4) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=3 & h=2 & g=2 -> 0.25:(s2'=1) & (s2t'=1) & (agent'=1) + 0.25:(s2'=2) & (s2t'=1) & (agent'=1) + 0.25:(s2'=3) & (s2t'=1) & (agent'=1) + 0.25:(s2'=4) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=3 & h=2 -> 0.5:(s2'=1) & (s2t'=1) & (agent'=1) + 0.5:(s2'=3) & (s2t'=1) & (agent'=1);
	
	//syncer
	[] s1t=1 & s2t=1 & agent=1 -> 1:(s1t'=0) & (s2t'=0) & (agent'=0) & (time'=time+1);

	// recycling loop for keeping times the same
	[] s1t=0 & s1=0 -> (s1'=0) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=1 -> (s1'=1) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=2 -> (s1'=2) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=3 -> (s1'=3) & (s1t'=1) & (agent'=1);
	[] s1t=0 & s1=4 -> (s1'=4) & (s1t'=1) & (agent'=1);

	[] s2t=0 & s2=0 -> (s2'=0) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=1 -> (s2'=1) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=2 -> (s2'=2) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=3 -> (s2'=3) & (s2t'=1) & (agent'=1);
	[] s2t=0 & s2=4 -> (s2'=4) & (s2t'=1) & (agent'=1);

	// finishing loop if site is nuteral
	//[] s1=4 | s2=4 -> true; 		// self-loop
	
	//call for agents
	[s1_hg] agent=0 & s1 = 1 | s1 = 3 -> true;	//call for agent human/UGV
	[s1_h] agent=0 & s1 = 2 | s1 = 3 -> true;		//call for agent human
	
	[s2_hg] agent=0 & s2 = 1 | s2 = 3 -> true;	//call for agent human/UGV
	[s2_h] agent=0 & s2 = 2 | s2 = 3 -> true;		//call for agent human

endmodule 


rewards "total_time"
	s1t=1 & s2t=1 & agent=1 : 1;
endrewards

