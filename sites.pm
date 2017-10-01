
#const num_sites#
mdp

module site0
	s0: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	
	[] s0=0 & (h=1 | a=1 | g=1) -> 0.25:(s0'=1) + 0.25:(s0'=2) + 0.25:(s0'=3) + 0.25:(s0'=4);
	//[site1_request_human] s0=1 -> true;
	[] s0=1 & h=1 & g=1 -> 0.5:(s0'=1) + 0.5:(s0'=4);
	[] s0=2 & h=1 -> 0.5:(s0'=2) + 0.5:(s0'=4);
	[] s0=3 & h=1 & g=1 -> 0.25:(s0'=1) + 0.25:(s0'=2) + 0.25:(s0'=3) + 0.25:(s0'=4);
	[] s0=3 & h=1 -> 0.5:(s0'=1) + 0.5:(s0'=3);
	[] s0=4 -> true; //self-loop
endmodule

#for a=1:num_sites#
module proc#a# = proc0 [ s0=s#a# ] endmodule
#end#