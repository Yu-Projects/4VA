mdp

//TODO: add information sharing betweeen sites and robots, humans
//TODO: model time information
//TODO: try controller synthesis to optimize properties (including pareto properties)
//TODO: scale up the number of humans, robots, sites


module human

	h: [0..2] init 0; // human position

	[] h=0 -> (h'=1);
	[] h=0 -> (h'=2);
	[] h=1 -> (h'=2);
	[] h=2 -> (h'=1);
	//[site1_request_human] h=2 -> 0.5:(h'=1) + 0.5:(h'=2);

endmodule


module uav

	a: [0..2] init 0; // uav position

	[] a=0 -> (a'=1);
	[] a=0 -> (a'=2);
	[] a=1 -> (a'=2);
	[] a=2 -> (a'=1);

endmodule


module ugv

	g: [0..2] init 0; // ugv position

	[] g=0 -> (g'=1);
	[] g=0 -> (g'=2);
	[] g=1 -> (g'=2);
	[] g=2 -> (g'=1);

endmodule


module site1
	
	s1: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	
	[] s1=0 & (h=1 | a=1 | g=1) -> 0.25:(s1'=1) + 0.25:(s1'=2) + 0.25:(s1'=3) + 0.25:(s1'=4);
	//[site1_request_human] s1=1 -> true;
	[] s1=1 & h=1 & g=1 -> 0.5:(s1'=1) + 0.5:(s1'=4);
	[] s1=2 & h=1 -> 0.5:(s1'=2) + 0.5:(s1'=4);
	[] s1=3 & h=1 & g=1 -> 0.25:(s1'=1) + 0.25:(s1'=2) + 0.25:(s1'=3) + 0.25:(s1'=4);
	[] s1=3 & h=1 -> 0.5:(s1'=1) + 0.5:(s1'=3);
	[] s1=4 -> true; // self-loop

endmodule 

module site2
	
	s2: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	
	[] s2=0 & (h=2 | a=2 | g=2) -> 0.25:(s2'=1) + 0.25:(s2'=2) + 0.25:(s2'=3) + 0.25:(s2'=4);
	[time] s2=1 & h=2 & g=2 -> 0.5:(s2'=1) + 0.5:(s2'=4);
	[] s2=2 & h=2 -> 0.5:(s2'=2) + 0.5:(s2'=4);
	[] s2=3 & h=2 & g=2 -> 0.25:(s2'=1) + 0.25:(s2'=2) + 0.25:(s2'=3) + 0.25:(s2'=4);
	[] s2=3 & h=2 -> 0.5:(s2'=1) + 0.5:(s2'=3);
	[] s2=4 -> true; // self-loop

endmodule 

//module controller 

//	[site1_request_human] s1=1 -> true;

//endmodule 

rewards
	[time]true : 1;
endrewards



