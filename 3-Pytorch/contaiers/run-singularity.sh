#!/bin/bash 

#SBATCH -t 01:30:00    			# walltime = 1 hours and 30 minutes
#SBATCH -N 1                         	# one node
#SBATCH -n 2                         	# two CPU cores
#SBATCH --gres=gpu:1g.10gb:1 		# one NVIDIA MIG GPU
#SBATCH --job-name "run-singularity"
#SBATCH --output=log-%x.%N.%J.out
#SBATCH --error=log-%x.%N.%J.err


module load singularity       		# load singularity module
singularity exec --nv -B /raid /raid/sif/pytorch-23.06.sif python /home/user03/train2024/3-Pytorch/batch/simple-pt.py
