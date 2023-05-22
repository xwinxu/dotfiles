"""Impossible to run multiple models using the same slurm resources, and using `&` hack in between python scripts will also not work since that register the completion of the wrapped
command as a signal to kill the job instead of waiting for the python command.

Command to launch:
`sbatch --partition=atlas --qos=normal parallel.sh "python model_1.py; python model_2.py; python model_3.py"`

or modify atlas.sh to run:
`atlas -g 1 "python model_1.py; python model_2.py; python model_3.py"`
"""

#!/usr/bin/env bash

IFS=';'; procs=($@); unset IFS;
let N=${#procs[@]}-1
for i in $(seq 0 $N); do
    echo Running ${procs[i]}
    ${procs[i]}
    pids[i]=$!
done

for pid in ${pids[*]}; do
    wait $pid
done
