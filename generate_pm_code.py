# Q.    Why?
# A.    Generating the PRISM code by hand for larger graphs is cumbersome. 
#       Running this script will generate fragments of PRISM code that you can
#       copy paste in the PRISM module.
#
# Q.    How?
# A.    Just run the file on the command prompt by typing out ``python generate_pm_code.py'' 
#       There are three input options: (1) Name of the file; (2) starting site number; and 
#       (3) ending site number. 
#       Just run this once and open the output file. It is easy to check the output.

fh = open("pm_code.txt","w")
xstart = 0 
xend = 20

for x in range(xstart, xend+1):
    for y in range(xstart, xend+1):
        fh.write("\t[human_%d_%d] h=site%d & !move_h -> (h'=site%d) & (move_h'=true);\r\n" % (x, y, x, y))

fh.write("\r\n\r\n");
for x in range(xstart, xend+1):
        fh.write("const int site%d = %d;\r\n" % (x, x))


fh.write("\r\n\r\n");
for x in range(xstart, xend+1):
        fh.write("module site_%s = site_one[s1=s%d, site1=site%d] endmodule\r\n" % (str(x), x, x))

fh.write("\r\n\r\n");
for x in range(xstart, xend+1):
        fh.write("& s%d=4 " % (x))

fh.write("\r\n\r\n");
for x in range(xstart, xend+1):
    for y in range(xstart, xend+1):
        fh.write("human_%d_%d=uav_%d_%d, " % (x, y, x, y))
    fh.write("\r\n")

fh.write("\r\n\r\n");

for x in range(xstart, xend+1):
    for y in range(xstart, xend+1):
        fh.write("human_%d_%d=ugv_%d_%d, " % (x, y, x, y))
    fh.write("\r\n")

fh.close()
