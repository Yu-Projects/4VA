
#const num_sites#
mdp
//const double num_sites=2 //number of sites

module human
	h: [0..num_sites] init 0; //human position

	#for a=0:num_sites#
	#for b=0:num_sites#
	[] h=#a# -> (h'=#b#);
	#end#
	#end#
endmodule


module UGV
	g: [0..num_sites] init 0; //UGV position

	#for a=0:num_sites#
	#for b=0:num_sites#
	[] g=#a# -> (g'=#b#);
	#end#
	#end#
endmodule


module UAV
	a: [0..num_sites] init 0; //UAV position

	#for a=0:num_sites#
	#for b=0:num_sites#
	[] a=#a# -> (a'=#b#);
	#end#
	#end#
endmodule
