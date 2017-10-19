mdp

//TODO: try controller synthesis to optimize properties (including pareto properties)
//TODO: scale up the number of humans, robots, sites
//Process:
	//loop for all agents
		// 1. choose an agent to move (h, g, a)
		// 2. set that agents counter (fh, fg, fa)
		// 3. set temperary location for that agent (fhtemp, fgtemp, fatemp)
	// end
	//loop for all sites
		// 4. sites update (s1, s2)
		// 5. set "no agent movement" lock (fagent)
		// 6. set site lock (fs1, fs2)
	//end
	// 7. update time (total_time)
	// 8. decrement counters (fh, fg, fa)
	//loop for all agents (XYZ)
		// 9. if fXYZ == 0 then update state (XYZ)
	//end
	//repeat all

// KEY TO VARIABLE CREATION
// mXYZ = movement speed for XYZ agent
// fXYZ = flag for XYZ agent or site
// dXY = distance from site X to site Y
// sX = site with ID of X

const int	num_sites=2; // number of sites
const int	total_edges=(num_sites*num_sites)+num_sites; //calculates the number of edges (this should correspond to the number of site distances)

// flag for sites and all agent
global		fagent : [0..1] init 0; // if agents are allowed to move or not
global		fs1:	[0..1] init 0; // lock for site1
global		fs2:	[0..1] init 0; // lock for site2
global		fagentf:[0..3] init 0; // lock for counters(fh, fg, fa)
// agents
global		h:	[0..num_sites] init 0; // human position
global		g:	[0..num_sites] init 0; // ugv position
global		a:	[0..num_sites] init 0; // uav position
// flag for agent in transition
global		fh:	[0..total_edges] init 0; // flag for human in transition
global		fg:	[0..total_edges] init 0; // flag for ugv in transition
global		fa:	[0..total_edges] init 0; // flag for uav in transition
// flag for temperary site
global		fhtemp: [0..num_sites] init 0; // temperary site for human holds next site location
global		fgtemp: [0..num_sites] init 0; // temperary site for ugv holds next site location
global		fatemp: [0..num_sites] init 0; // temperary site for uav holds next site location
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
const int	mh=2; // human speed
const int	mg=2; // ugv speed
const int	ma=1; // uav speed

// states do not include 0. 0 means that the agent is not at any state

module Human
//	[]	agentlock & counterlock & agentcounter & sitelocation -> tempsitelocation & agentcounter
	[]	fagent=0 & fagentf=0 & fh=0 & h=0 -> (fhtemp'=1) & (fh'=d01*mh);
	[]	fagent=0 & fagentf=0 & fh=0 & h=0 -> (fhtemp'=2) & (fh'=d02*mh);

	[]	fagent=0 & fagentf=0 & fh=0 & h=1 -> (fhtemp'=1) & (fh'=d11*mh);
	[]	fagent=0 & fagentf=0 & fh=0 & h=1 -> (fhtemp'=2) & (fh'=d12*mh);

	[]	fagent=0 & fagentf=0 & fh=0 & h=2 -> (fhtemp'=1) & (fh'=d21*mh);
	[]	fagent=0 & fagentf=0 & fh=0 & h=2 -> (fhtemp'=2) & (fh'=d22*mh);
endmodule

module UGV
//	[]	agentlock & counterlock & agentcounter & sitelocation -> tempsitelocation & agentcounter
	[]	fagent=0 & fagentf=0 & fg=0 & g=0 -> (fgtemp'=1) & (fg'=d01*mg);
	[]	fagent=0 & fagentf=0 & fg=0 & g=0 -> (fgtemp'=2) & (fg'=d02*mg);

	[]	fagent=0 & fagentf=0 & fg=0 & g=1 -> (fgtemp'=1) & (fg'=d11*mg);
	[]	fagent=0 & fagentf=0 & fg=0 & g=1 -> (fgtemp'=2) & (fg'=d12*mg);

	[]	fagent=0 & fagentf=0 & fg=0 & g=2 -> (fgtemp'=1) & (fg'=d21*mg);
	[]	fagent=0 & fagentf=0 & fg=0 & g=2 -> (fgtemp'=2) & (fg'=d22*mg);
endmodule

module UAV
//	[]	agentlock & counterlock & agentcounter & sitelocation -> tempsitelocation & agentcounter
	[]	fagent=0 & fagentf=0 & fa=0 & a=0 -> (fatemp'=1) & (fa'=d01*ma);
	[]	fagent=0 & fagentf=0 & fa=0 & a=0 -> (fatemp'=2) & (fa'=d02*ma);

	[]	fagent=0 & fagentf=0 & fa=0 & a=1 -> (fatemp'=1) & (fa'=d11*ma);
	[]	fagent=0 & fagentf=0 & fa=0 & a=1 -> (fatemp'=2) & (fa'=d12*ma);

	[]	fagent=0 & fagentf=0 & fa=0 & a=2 -> (fatemp'=1) & (fa'=d21*ma);
	[]	fagent=0 & fagentf=0 & fa=0 & a=2 -> (fatemp'=2) & (fa'=d22*ma);
endmodule

module sites
	s1:	[0..4] init 0; // state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	s2:	[0..4] init 0; // state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)

	// site1
	// movement from unknown to random known state
	[]	fagentf=0 & fs1=0 & s1=0 & (h=1 | a=1 | g=1) -> 0.25:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=3) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=4) & (fs1'=1) & (fagent'=1);
	// different known states and their needed agents
	[]	fagentf=0 & fs1=0 & s1=1 & h=1 & g=1 -> 0.5:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=2 & h=1 -> 0.5:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=3 & h=1 & g=1 -> 0.25:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=2) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=3) & (fs1'=1) & (fagent'=1) + 0.25:(s1'=4) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=3 & h=1 -> 0.5:(s1'=1) & (fs1'=1) & (fagent'=1) + 0.5:(s1'=3) & (fs1'=1) & (fagent'=1);
	// site2
	// movement from unknown to random known state
	[]	fagentf=0 & fs2=0 & s2=0 & (h=2 | a=2 | g=2) -> 0.25:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=3) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=4) & (fs2'=1) & (fagent'=1);
	// different known states and their needed agents
	[]	fagentf=0 & fs2=0 & s2=1 & h=2 & g=2 -> 0.5:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=2 & h=2 -> 0.5:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=3 & h=2 & g=2 -> 0.25:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=2) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=3) & (fs2'=1) & (fagent'=1) + 0.25:(s2'=4) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=3 & h=2 -> 0.5:(s2'=1) & (fs2'=1) & (fagent'=1) + 0.5:(s2'=3) & (fs2'=1) & (fagent'=1);

	// recycling loop for keeping times the same
	[]	fagentf=0 & fs1=0 & s1=0 -> (s1'=0) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=1 -> (s1'=1) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=2 -> (s1'=2) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=3 -> (s1'=3) & (fs1'=1) & (fagent'=1);
	[]	fagentf=0 & fs1=0 & s1=4 -> (s1'=4) & (fs1'=1) & (fagent'=1);

	[]	fagentf=0 & fs2=0 & s2=0 -> (s2'=0) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=1 -> (s2'=1) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=2 -> (s2'=2) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=3 -> (s2'=3) & (fs2'=1) & (fagent'=1);
	[]	fagentf=0 & fs2=0 & s2=4 -> (s2'=4) & (fs2'=1) & (fagent'=1);
endmodule 

module syncer
	// syncer
	[]	fs1=1 & fs2=1 & fagent=1 & fagentf=0 -> 1:(fs1'=0) & (fs2'=0) & (fagent'=0) & (fagentf'=3); // main update for all site flags and agent flag
	// human counter update
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=3 & fh!=0 & fh!=1 -> (fh'=fh-1) & (fagentf'=2); // decrement counter
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=3 & fh=1 -> (h'=fhtemp) & (fh'=fh-1) & (fagentf'=2); // decrement counter and update state of human
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=3 & fh=0 -> (fagentf'=2); // do nothing
	// ugv counter update
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=2 & fg!=0 & fg!=1 -> (fg'=fg-1) & (fagentf'=1); // decrement counter
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=2 & fg=1 -> (g'=fgtemp) & (fg'=fg-1) & (fagentf'=1); // decrement counter and update state of ugv
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=2 & fg=0 -> (fagentf'=1); // do nothing
	// uav counter update
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=1 & fa!=0 & fa!=1 -> (fa'=fa-1) & (fagentf'=0); // decrement counter
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=1 & fa=1 -> (a'=fatemp) & (fa'=fa-1) & (fagentf'=0); // decrement counter and update state of uav
	[]	fs1=0 & fs2=0 & fagent=0 & fagentf=1 & fa=0 -> (fagentf'=0); // do nothing
endmodule

rewards "total_time"
	// total time taken 
	[]fs1=1 & fs2=1 & fagent=1 : 1;
endrewards

