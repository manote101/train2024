#!/bin/bash

#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=0
#SBATCH --gres=gpu:1			# request 1 GPU, you can also use --gpus=1
#SBATCH --job-name "simple-pt"
#SBATCH --output=log-%x.%N.%J.out
#SBATCH --error=log-%x.%N.%J.err

# load module
# module load python3

# And finally run the jobs
srun --container-image=/dataset/squashfs/nvidia+pytorch+23.01-py3.sqsh \
     --container-name=pytorch \
     --container-workdir=$(pwd) \
     python simple-pt.py
