## How to run

```Shell
enroot list 		# this command run on your local node. Hence, there might be some errors/warnings if your are on Headnode.


srun enroot list  	# this command will be submitted by Slurm, so it will run on Compute node(s)
```

## Method#1: run with srun
```Shell
cd cluster-demo/pytorch
srun --container-image=/dataset/squashfs/nvidia+pytorch+23.01-py3.sqsh --container-name=pytorch --container-workdir=$(pwd) --gpus=1 python simple-pt.py
```
```Shell
srun enroot list
srun --gpus=1 enroot start pyxis_pytorch nvidia-smi
```

## Method#2: run with sbatch
```Shell
sbatch simple-pt.sub
```

## Method #1: Demo MNIST trainig in PyTorch
```Shell
git clone https://github.com/ChawDoe/LeNet5-MNIST-PyTorch.git

cd LeNet5-MNIST-PyTorch
srun --gpus=1 --container-image=/dataset/squashfs/nvidia+pytorch+23.01-py3.sqsh \
 --container-name=pytorch --container-workdir=$(pwd) \
 python train.py
```

## Method #2: Run Training with Singularity
```Shell
module load singularity
time srun singularity run --nv -B /raid /raid/sif/pytorch-23.06.sif python train.py
```
