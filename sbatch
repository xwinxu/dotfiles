#!/bin/bash
#SBATCH --partition=atlas --qos=normal
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

# only use the following on partition with GPUs
#SBATCH --gres=gpu:1

#SBATCH --job-name="sample"
#SBATCH --output=sample-%j.out

# list out some useful information
echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR

cd /path/to/pwd
python /relative/path/to/file

####echo NPROCS=$NPROCS
# done
echo "Done"

###### To run ######
# sbatch --partition=atlas --qos=normal --time=02:00:00 --nodes=1 \
#        --cpus-per-task=4 --mem=8G \
#        --gres=gpu:1 --job-name="sample" --output="sample-%j.out"\
#        --wrap="python /relative/path/to/file"
