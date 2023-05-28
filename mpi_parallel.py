"""
In this section, we'll discuss data parallelism on PyTorch. The easiest way to get started with data parallelism is to use torch.nn.DataParallel. However, this has a few (minor) downsides:

A simple barebones way to do data parallelism is by using mpiexec and from mpi4py import MPI in conjunction with NVIDIA's apex.parallel.Reducer:
`mpiexec -n NUM python ...`, e.g. on machine with 2 GPUs and handling 2 tasks each: `mpiexec -n 2 python example.py`
will run NUM duplicates of your python script, each given a worker rank that you can access in your script via MPI.COMM_WORLD.Get_rank(). 
You can use the rank to shard your data using nn.DistributedSampler. 
After each backprop step, simply use apex.parallel.Reducerto reduce the gradients across your processes.

sbatch job: `atlas -g NUM -t NUM mpiexec -n NUM python example.py`
"""

from apex.parallel import Reducer
from mpi4py import MPI
from torch import nn
import os
import socket
import torch
import torch.distributed as dist

# Get rank information
rank = MPI.COMM_WORLD.Get_rank()
nranks = MPI.COMM_WORLD.Get_size()

# Set up torch.dist environment
os.environ["RANK"] = str(rank)
os.environ["WORLD_SIZE"] = str(nranks)
os.environ["MASTER_PORT"] = str(29500)  # Change the port if it's already taken
os.environ["MASTER_ADDR"] = MPI.COMM_WORLD.bcast(socket.gethostname(), root=0)
dist.init_process_group(backend='nccl', init_method=f"env://")
torch.cuda.set_device(rank)

net = nn.Linear(3, 2).cuda()
print(f"Worker {rank}: Pre-Sync\n{net.weight}")
reducer = Reducer(net) # Sets up the reducer object and syncs weights
print(f"Worker {rank}: Post-Sync\n{net.weight}")

net.weight.grad = torch.full((3, 2), fill_value=rank, dtype=torch.float32).cuda().T  # Gradient modification shenanigans
print(f"Worker {rank}: Pre-Reduction\n{net.weight.grad}")
reducer.reduce() # Averages the .grad for all parameters in module
print(f"Worker {rank}: Post-Reduction\n{net.weight.grad}")
