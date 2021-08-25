#!/bin/bash

if [ $# -eq 0 ]; then
    srun --partition=atlas-interactive --gres=gpu:4 --mem=70GB --pty bash
elif [ $1 == "titanxp" ]; then
    srun --partition=atlas-interactive --gres=gpu:titanxp:1 --cpus-per-task=8 --exclude=atlas18 --time=12:00:00 --pty bash 
else
    echo "Did not specify a partition or titanxp"
fi
