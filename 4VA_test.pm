mdp

//operation parameters
//const double p=0.5; // probability of increasing workload due to other uncertain tasks
//const double accu_load1; // accuracy at the low workload level (real numbers between 0 and 1)
//const double accu_load2; // accuracy at the high workload level (real numbers between 0 and 1)
//const double fd; // accuracy discount due to fatigue (real numbers between 0 and 1)
//const int COUNTER; // fatigue threshold (integers, e.g, 10)
//const double risky2; // at w2: probability of choosing a risky route
//const double risky6; // at w6: probability of choosing a risky route


//formula rewards = //QUESTIONS ON HOW TO INPUT THE REWARD FUNCTION

module fire_rescue_single_site
	
	// descriptors
	s: [0..1] init 0; //sites (site 0 & site 1)
	d: [0..4] init 0; //state of the site (0 unknown, 1 fire, 2 human, 3 fire+human, 4 nuteral)
	a: [0..7] init 0; //agents (0 no-one, 1 Human, 2 UGV, 3 UAV, 4 Human+UGV, 5 Human+UAV, 6 UGV+UAV, 7 Human+UGV+UAV)
	
	//transitions
		//moving from unknown (d=0) to a known state (d!=0) with any agent (a!=0)
		//s=0 has d=1 needs a=4
		//s=1 has d=2 needs a=1
//	[] s=0 & d=0 & a=0-> 1/7:(a'=1)&(d'=1)&(s'=0)
//				+1/7:(a'=2)&(d'=1)&(s'=0)
//				+1/7:(a'=3)&(d'=1)&(s'=0)
//				+1/7:(a'=4)&(d'=1)&(s'=0)
//				+1/7:(a'=5)&(d'=1)&(s'=0)
//				+1/7:(a'=6)&(d'=1)&(s'=0)
//				+1/7:(a'=7)&(d'=1)&(s'=0);
//	[] s=1 & d=0 & a=0-> 1/7:(a'=1)&(d'=2)&(s'=1)
//				+1/7:(a'=2)&(d'=2)&(s'=1)
//				+1/7:(a'=3)&(d'=2)&(s'=1)
//				+1/7:(a'=4)&(d'=2)&(s'=1)
//				+1/7:(a'=5)&(d'=2)&(s'=1)
//				+1/7:(a'=6)&(d'=2)&(s'=1)
//				+1/7:(a'=7)&(d'=2)&(s'=1);

		//from a known site (d!=0) to a nuteral site (d=4) with correct agent (a=1 & d=2 | a=4 & d=1)
		//these set of equations are for transitions and rewards
		//they can be changed to accomodate for new state+agent needs/rewards for each transition/probability to enter a state
//	[] d=1 & a=4 -> 0.8:(a'=4)&(d'=4)&(s'=s) + 0.2:(a'=a)&(d'=d)&(s'=s);
//	[] d=2 & a=1 -> 0.9:(a'=1)&(d'=4)&(s'=s) + 0.1:(a'=a)&(d'=d)&(s'=s);
//	[] d=3 & a=4 -> 0.8:(a'=4)&(d'=4)&(s'=s) + 0.1:(a'=a)&(d'=d)&(s'=s) + 0.1:(a'=a)&(d'=1)&(s'=s);
//	[] d=3 & a=1 -> 0.8:(a'=1)&(d'=1)&(s'=s) + 0.2:(a'=a)&(d'=d)&(s'=s);
//	[] d=4 -> 1:(d'=4)&(s'=s);

		//this section is for restricting movement from site to site (s is the main operator)
//	[] s=0 -> 1:(s'=0);
//	[] s=1 -> 0.5:(s'=0) + 0.5:(s'=1);	//commented for simplisity and smaller case

		//disaster state change (d is the main operator)
	[] d=0 & (a!=0)-> 1/4:(d'=1) + 1/4:(d'=2) + 1/4:(d'=3) + 1/4:(d'=4);
	[] d=1 & (a=4 | a=7) -> 0.5:(d'=1) + 0.5:(d'=4);
	[] d=2 & (a=1 | a=4 | a=5 | a=7) -> 0.5:(d'=2) + 0.5:(d'=4);
	[] d=3 & (a=4 | a=7)-> 0.25:(d'=1) + 0.25:(d'=2) + 0.25:(d'=3) + 0.25:(d'=4);
	[] d=3 & (a=1 | a=5)-> 0.5:(d'=1) + 0.5:(d'=3);
	[] d=4 -> 1:(d'=4);

		//random agent movement (a is the main operator)
	[] a=0 & (d=0)-> 1/8:(a'=0) + 1/8:(a'=1) + 1/8:(a'=2) + 1/8:(a'=3) + 1/8:(a'=4) + 1/8:(a'=5) + 1/8:(a'=6) + 1/8:(a'=7);
	[] a=1 & d!=0 & (d=2 | d=3) -> 1:(a'=1);
	[] a=1 & d!=0 & (d=1) -> 1/7:(a'=0) + 1/7:(a'=2) + 1/7:(a'=3) + 1/7:(a'=4) + 1/7:(a'=5) + 1/7:(a'=6) + 1/7:(a'=7);
	[] a=2 & (d!=0) -> 1/7:(a'=0) + 1/7:(a'=1) + 1/7:(a'=3) + 1/7:(a'=4) + 1/7:(a'=5) + 1/7:(a'=6) + 1/7:(a'=7);
	[] a=3 & (d!=0) -> 1/7:(a'=0) + 1/7:(a'=1) + 1/7:(a'=2) + 1/7:(a'=4) + 1/7:(a'=5) + 1/7:(a'=6) + 1/7:(a'=7);
	[] a=4 & d!=0 & (d=1 | d=2 | d=3) -> 1:(a'=4);
//	[] a=4 & d!=0 & (d=4) -> 1/7:(a'=0) + 1/7:(a'=1) + 1/7:(a'=2) + 1/7:(a'=3) + 1/7:(a'=5) + 1/7:(a'=6) + 1/7:(a'=7);
	[] a=5 & d!=0 & (d=2 | d=3) -> 1:(a'=5);
	[] a=5 & d!=0 & (d=1) -> 1/7:(a'=0) + 1/7:(a'=1) + 1/7:(a'=2) + 1/7:(a'=3) + 1/7:(a'=4) + 1/7:(a'=6) + 1/7:(a'=7);
	[] a=6 & (d!=0) -> 1/8:(a'=0) + 1/8:(a'=1) + 1/8:(a'=2) + 1/8:(a'=3) + 1/8:(a'=4) + 1/8:(a'=5) + 1/8:(a'=6) + 1/8:(a'=7);
	[] a=7 & d!=0 & (d=1 | d=2 | d=3) -> 1:(a'=7);
//	[] a=7 & d!=0 & (d=4) -> 1/7:(a'=0) + 1/7:(a'=1) + 1/7:(a'=2) + 1/7:(a'=3) + 1/7:(a'=4) + 1/7:(a'=5) + 1/7:(a'=6);
	

endmodule

rewards	"site_reward"
//	s=0 & d=4 & (a=1: 5;
	s=0 & d=4 : 10;
endrewards