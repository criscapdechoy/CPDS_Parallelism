#!/bin/bash
	# @ job_name		= heatmpi.extrae
	# @ partition		= debug
	# @ initialdir		= .
	# @ output		= heatmpi.extrae.%j.out
	# @ error		= heatmpi.extrae.%j.err
	# @ total_tasks		= 4
	# @ cpus_per_task	= 1
	# @ tasks_per_node	= 4
	# @ wall_clock_limit	= 00:02:00

prog=heatmpi

srun -n 1 ./$prog test.dat
srun -n 2 ./$prog test.dat
srun -n 4 ./$prog test.dat
srun -n 6 ./$prog test.dat
srun -n 8 ./$prog test.dat
srun -n 10 ./$prog test.dat
srun -n 12 ./$prog test.dat

