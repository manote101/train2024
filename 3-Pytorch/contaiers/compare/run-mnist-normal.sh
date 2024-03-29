#!/bin/bash

mkdir normal
cd normal

## Clone Demo MNIST trainig in PyTorch
git clone https://github.com/ChawDoe/LeNet5-MNIST-PyTorch.git

# copy training program
cp ../mnist-train1.py LeNet5-MNIST-PyTorch

# copy Slurm script
cp ../sing-normal.sub LeNet5-MNIST-PyTorch

cd LeNet5-MNIST-PyTorch
sbatch sing-normal.sub
