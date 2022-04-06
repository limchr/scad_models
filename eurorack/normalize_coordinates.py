#!/usr/bin/python3

import numpy as np
import sys

# c = [[8.28,24.18],[24.77,24.18],[41.33,24.18], [10.16,90.16], [39.36,90.16],  [24.75, 39.76],[8.12,55.32], [41.25,55.3],[8.21,71.81],[41.2,71.9]]



if len(sys.argv) != 2:
	print('usage: normalize_coordinates.py [2d_coordinates]')
else:
		
	c = eval(sys.argv[1])

	c = np.array(c)
	c = c - c.min(axis=0)
	max_xy = c.max(axis=0)
	c[:,0] = np.ones(c[:,0].shape)*max_xy[0]-c[:,0]
	c[:,1] = np.ones(c[:,1].shape)*max_xy[1]-c[:,1]
	print('// coordinates for user control elements')
	print('elems = '+str(c)+';')
	print('// elements span in x direction')
	print('el_sx = '+str(max_xy[0])+';')
	print('// elements span in y direction')
	print('el_sy = '+str(max_xy[1])+';')
	print('// elements radi')
	print('el_r = ['+''.join(',' for i in c[:-1])+']')
