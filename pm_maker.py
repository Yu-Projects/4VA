git #!/usr/bin/env python
# creating a .pm module for Prism

import numpy as np

vertices = [0,1,2,3,4,5,6]  #array of vertices
numVertices = 6 #number of vertices
type = 'mdp'    #type of Prism model being made
lowCost = 1     #minimum distance cost
highCost = 4    #maximum distance cost
maxTime = 20    #max for the timing constants of each agent (clock_X)
speedHuman = 3  #human travel speed (time/distance)
speedUAV = 1    #UAV travel speed (time/distance)
speedUGV = 2    #UGV travel speed (time/distance)
filename = 'test.pm'    #filename
file = open(filename,"w")

file.write(type + '\n')
#Constants
#Distance Constants
for b in range (0, numVertices+1):
    for a in range (b,numVertices+1):
        if a != b:
            cost = np.random.random_integers(lowCost, high=highCost)
            file.write('const int D' + repr(b) + repr(a) + ' = ' + repr(cost) + ';\n')

#Sites
file.write('const int N = ' + repr(numVertices) + ';\n')
for a in range(0,numVertices+1):
    file.write('const int site' + repr(a) + ' = ' + repr(a) + ';\n')

#Timing Constants
file.write('const int Ch_MAX = ' + repr(maxTime) + ';\n')
file.write('const int Ca_MAX = ' + repr(maxTime) + ';\n')
file.write('const int Cg_MAX = ' + repr(maxTime) + ';\n')

#Speed Constatnts
file.write('const int Sh = ' + repr(speedHuman) + ';\n')
file.write('const int Sa = ' + repr(speedUAV) + ';\n')
file.write('const int Sg = ' + repr(speedUGV) + ';\n')

#Site Information/States
file.write('const int state0 = 0;\n')
file.write('const int state1 = 1;\n')
file.write('const int state2 = 2;\n')
file.write('const int state3 = 3;\n')
file.write('const int state4 = 4;\n')

#Agent Module
file.write('module human\n')
file.write('h: [0..N] init 0;\n')
file.write('clock_h: [0..Ch_MAX] init 0;\n')
file.write('move_h : bool init false;\n')
    #Time Passage
file.write('[time] clock_h>1 -> (clock_h\' = clock_h-1);\n')
file.write('[time] clock_h=1 -> (clock_h\'=0) & (move_h\'=false);\n')
    #Human Stays at the Same State
file.write('[] clock_h=0 & !move_h -> (clock_h\'=1);\n')
    #Movement Between States
#TODO: Fill in codd for movement between sites

file.write('endmodule')


#file.write(repr(vertices+1) + ' ' + repr(counter) + ' -1\n')
#file.write('EOF')

file.close()

