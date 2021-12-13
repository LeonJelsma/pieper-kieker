# This scripts converts raw ros topic logging data into a file that ros can use to navigate autonimously

import sys
import re

with open(sys.argv[1], 'r') as log_file:
	p = re.compile('latitude: (.*)\nlongitude: (.*)\n')
	with open(sys.argv[1].rsplit('.', 1)[0] + ".txt", "a") as gps_file:
		for m in p.finditer(log_file.read()):
			gps_file.write(m.group(1))
			gps_file.write(" ")
			gps_file.write(m.group(2))
			gps_file.write("\n")
