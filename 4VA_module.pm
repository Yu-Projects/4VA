mdp

//TODO: try controller synthesis to optimize properties (including pareto properties)
//TODO: scale up the number of humans, robots, sites
//TODO: how do you allow for sites to do both change at the same time without doing an exhaustive creation of lines

// KEY TO VARIABLE CREATION
// mXYZ = movement speed for XYZ agent
// fXYZ = flag for XYZ agent or site
// dXY = distance from site X to site Y
// sX = site with ID of X

const int	num_sites=2;
const int	total_edges=(num_sites*num_sites)+num_sites; //calculates the number of edges
global		fagent : [0..1] init 0; // if there is an agent there or not
global		fh:	[0..total_edges] init 0; // flag for human transition speed


// site distances (unit distnace) dXY
const int	d01=2;
const int	d02=2;
const int	d11=0;
const int	d12=4;
const int	d21=8;
const int	d22=0;
// only one edge out from 0
// sites can stay at the same site for 0 distance
// fully connected directed graph

// movement speed (time/unit distance) mXYZ
const int	mhuman=2;
const int	mugv=2;
const int	muav=1;

// states do not include 0. 0 means that the agent is not at any state
// fXYZ at 0 mean possibility to move

module Human
	h:	[0..num_sites] init 0; // human position


//	[] agent=0 & h=0 -> (h'=0);
	[]	fagent=0 & fh=0 & h=0 -> (h'=1) & (fh'=d01*mhuman);
	[s1_hg]	fagent=0 & fh=0 & h=0 -> (h'=1) & (fh'=d01*mhuman);
	[s1_h]	fagent=0 & fh=0 & h=0 -> (h'=1) & (fh'=d01*mhuman);
	[]	fagent=0 & fh=0 & h=0 -> (h'=2) & (fh'=d02*mhuman);
	[s2_hg]	fagent=0 & fh=0 & h=0 -> (h'=2) & (fh'=d02*mhuman);
	[s2_h]	fagent=0 & fh=0 & h=0 -> (h'=2) & (fh'=d02*mhuman);

//	[] agent=0 & h=1 -> (h'=0);
	[]	fagent=0 & fh=0 & h=1 -> (h'=1) & (fh'=d11*mhuman);
	[s1_hg]	fagent=0 & fh=0 & h=1 -> (h'=1) & (fh'=d11*mhuman);
	[s1_h]	fagent=0 & fh=0 & h=1 -> (h'=1) & (fh'=d11*mhuman);
	[]	fagent=0 & fh=0 & h=1 -> (h'=2) & (fh'=d12*mhuman);
	[s2_hg]	fagent=0 & fh=0 & h=1 -> (h'=2) & (fh'=d12*mhuman);
	[s2_h]	fagent=0 & fh=0 & h=1 -> (h'=2) & (fh'=d12*mhuman);

//	[] agent=0 & h=2 -> (h'=0);
	[]	fagent=0 & fh=0 & h=2 -> (h'=1) & (fh'=d21*mhuman);
	[s1_hg]	fagent=0 & fh=0 & h=2 -> (h'=1) & (fh'=d21*mhuman);
	[s1_h]	fagent=0 & fh=0 & h=2 -> (h'=1) & (fh'=d21*mhuman);
	[]	fagent=0 & fh=0 & h=2 -> (h'=2) & (fh'=d22*mhuman);
	[s2_hg]	fagent=0 & fh=0 & h=2 -> (h'=2) & (fh'=d22*mhuman);
	[s2_h]	fagent=0 & fh=0 & h=2 -> (h'=2) & (fh'=d22*mhuman);
endmodule

module UGV
	g:	[0..num_sites] init 0; // ugv position
	fg:	[0..num_sites] init 0; // flag for UGV transition speed

//	[] agent=0 & g=0 -> (g'=0);
	[]	fagent=0 & g=0 -> (g'=1);
	[s1_hg]	fagent=0 & g=0 -> (g'=1);
	[]	fagent=0 & g=0 -> (g'=2);
	[s2_hg]	fagent=0 & g=0 -> (g'=2);

//	[] agent=0 & g=1 -> (g'=0);
	[]	fagent=0 & g=1 -> (g'=1);
	[s1_hg]	fagent=0 & g=1 -> (g'=1);
	[]	fagent=0 & g=1 -> (g'=2);
	[s2_hg]	fagent=0 & g=1 -> (g'=2);

//	[] agent=0 & g=2 -> (g'=0);
	[]	fagent=0 & g=2 -> (g'=1);
	[s1_hg]	fagent=0 & g=2 -> (g'=1);
	[]	fagent=0 & g=2 -> (g'=2);
	[s2_hg]	fagent=0 & g=2 -> (g'=2);
endmodule

module UAV
	a:	[0..num_sites] init 0; // uav position
	fa:	[0..num_sites] init 0; //flag for UAV transition speed

//	[] agent=0 & a=0 -> (a'=0);
	[]	fagent=0 & a=0 -> (a'=1);
	[]	fagent=0 & a=0 -> (a'=2);

//	[] agent=0 & a=1 -> (a'=0);
	[]	fagent=0 & a=1 -> (a'=1);
	[]	fagent=0 & a=1 -> (a'=2);

//	[] agent=0 & a=2 -> (a'=0);
	[]	fagent=0 & a=2 -> (a'=1);
	[]	fagent=0 & a=2 -> (a'=2);
endmodule

module sites
	s1:	[0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	s2:	[0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	fs1:	[0..1] init 0;
	fs2:	[0..1] init 0;
	// time: [0..100] init 0;	//reward variable for keeping track of time

	//site1
	[]	fs1=0 & s1=0 & (h=1 | a=1 | g=1) -> 0.25:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=3) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=1 & h=1 & g=1 -> 0.5:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=2 & h=1 -> 0.5:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=3 & h=1 & g=1 -> 0.25:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=3) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=3 & h=1 -> 0.5:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=3) & (fs1'=1) & (fagent'=1);
	//site2
	[]	fs2=0 & s2=0 & (h=2 | a=2 | g=2) -> 0.25:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=3) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=1 & h=2 & g=2 -> 0.5:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=2 & h=2 -> 0.5:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=3 & h=2 & g=2 -> 0.25:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=3) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=3 & h=2 -> 0.5:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=3) & (fs2'=1) & (fagent'=1);
	
	//syncer
	[]	fs1=1 & fs2=1 & fagent=1 -> 1:(fs1'=0) & (fs2'=0) & (fagent'=0) & (fh'=fh-1);

	// recycling loop for keeping times the same
	[]	fs1=0 & s1=0 -> (s1'=0) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=1 -> (s1'=1) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=2 -> (s1'=2) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=3 -> (s1'=3) & (fs1'=1) & (fagent'=1);
	[]	fs1=0 & s1=4 -> (s1'=4) & (fs1'=1) & (fagent'=1);

	[]	fs2=0 & s2=0 -> (s2'=0) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=1 -> (s2'=1) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=2 -> (s2'=2) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=3 -> (s2'=3) & (fs2'=1) & (fagent'=1);
	[]	fs2=0 & s2=4 -> (s2'=4) & (fs2'=1) & (fagent'=1);

	// finishing loop if site is nuteral
	//[] s1=4 | s2=4 -> true; 		// self-loop
	
	//call for agents
	[s1_hg]	fagent=0 & s1 = 1 | s1 = 3 -> true;	//call for agent human/UGV
	[s1_h]	fagent=0 & s1 = 2 | s1 = 3 -> true;		//call for agent human
	
	[s2_hg]	fagent=0 & s2 = 1 | s2 = 3 -> true;	//call for agent human/UGV
	[s2_h]	fagent=0 & s2 = 2 | s2 = 3 -> true;		//call for agent human

endmodule 


rewards "total_time"
	[]fs1=1 & fs2=1 & fagent=1 : 1;
endrewards

