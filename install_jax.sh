#!/bin/bash
#PYTHON_VERSION=cp37  # alternatives: cp36, cp37, cp38
#CUDA_VERSION=cuda102  # alternatives: cuda92, cuda100, cuda101, cuda102
#PLATFORM=linux_x86_64  # alternatives: linux_x86_64
#BASE_URL='https://storage.googleapis.com/jax-releases'
##pip install --upgrade $BASE_URL/$CUDA_VERSION/jaxlib-0.1.43-$PYTHON_VERSION-none-$PLATFORM.whl
#pip install --upgrade $BASE_URL/$CUDA_VERSION/jaxlib-0.1.64-$PYTHON_VERSION-none-$PLATFORM.whl
##pip install --upgrade $BASE_URL/$CUDA_VERSION/jaxlib-0.1.45-$PYTHON_VERSION-none-$PLATFORM.whl
#pip install --upgrade jax  # install jax
#
export PYTHONPATH=/scratch/ssd001/home/winniexu/jax:$PYTHONPATH
export LD_LIBRARY_PATH=/scratch/ssd001/pkgs/cuda-11.0/lib64:/scratch/ssd001/pkgs/cudnn-11.0-v8.0.5.39/lib64:$LD_LIBRARY_PATH
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/scratch/ssd001/pkgs/cuda-11.0
CUDA_VERSION=11.0
# careful when hardcoding the cuda version
#pip install --upgrade jax jaxlib==0.1.64+cuda110 -f https://storage.googleapis.com/jax-releases/jax_releases.html
pip install --upgrade jax jaxlib==0.1.69+cuda110 -f https://storage.googleapis.com/jax-releases/jax_releases.html
