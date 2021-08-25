#!/bin/bash

d=`date +%d-%m-%Y`
JOBNAME="cpu-sbint"
cd /atlas/u/winniexu/<project_dir>

GPUS=0
echo "Number of GPUs: "${GPUS}

SCRIPT="python main.py"
LOG_FOLDER="~/slurm/${d}"
echo ${SCRIPT}
echo "Log Folder:"${LOG_FOLDER}
mkdir -p ${LOG_FOLDER}/${JOBNAME}/log

sbatch --output=${LOG_FOLDER}/log/%j.o --error=${LOG_FOLDER}/log/%j.e \
    --exclude=atlas1,atlas2,atlas3,atlas4,atlas5,atlas6,atlas18 \
    --nodes=1 --ntasks-per-node=1 --time=3-12:00:00 --mem=60G \
    --partition=atlas --cpus-per-task=4 \
    --gres=gpu:${GPUS} --job-name=${JOBNAME} --wrap="${SCRIPT}"
