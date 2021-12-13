# This script converts raw ros topic logging data into csv file format for drawing graphs or routes

import sys
import re

with open(sys.argv[1], 'r') as log_file:
	p = re.compile('.*\n.*: (.*)\n.*\n.*: (.*)\n.*: *(.*)\n.*: (.*)\n.*\n.*\n.*\n.*: (.*)\n.*: (.*)\n.*\n.*: (.*)\n.*: (.*)\n---\n')
	with open(sys.argv[1].rsplit('.', 1)[0] + ".csv", "a") as csv_file:
		csv_file.write("seq, secs, nsecs, frame_id, latitude, longitude, position_covariance, position_covariance_type\n")
		for m in p.finditer(log_file.read()):
			csv_file.write(m.group(1))
			csv_file.write(", " + m.group(2))
			csv_file.write(", " + m.group(3))
			csv_file.write(", " + m.group(4))
			csv_file.write(", " + m.group(5))
			csv_file.write(", " + m.group(6))
			csv_file.write(", " + m.group(7))
			csv_file.write(", " + m.group(8) + "\n")
