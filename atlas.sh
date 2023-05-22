"""Symlink this to `atlas` command to launch scripts easily.

e.g. `atlas python ...`
`atlas -g 0 -e 23 echo hello world!`
"""

#!/usr/bin/env bash

# Set important defaults. I've never really had to change anything else
exclude=""
time=1-00:00:00
name="job"
ngpus=1
mem=8
cmd=""
cpus_per_task=1
ntasks=1

default_mem=true
default_ntasks=true

# Override defaults
while :; do
    case $1 in
        -e|--exclude) exclude=$2
                      shift
                      ;;
        -T|--time) time=$2
                   shift
                   ;;
        -n|--name) name=$2
                   shift
                   ;;
        -g|--ngpus) ngpus=$2
                    shift
                    ;;
        -m|--mem) default_mem=false
                  mem=$2
                  shift
                  ;;
        -t|--ntasks) default_ntasks=false
                     ntasks=$2
                     shift
                     ;;
        -c|--cpus-per-task) cpus_per_task=$2
                            shift
                            ;;
        *) break
    esac
    shift
done

# Assume mem is 8 * num gpus unless override
if [ $ngpus != 0 ] && [ $default_mem = true ]; then
    let mem=$ngpus*8
fi

# Assume num tasks = num gpus unless override
if [ $ngpus != 0 ] && [ $default_ntasks = true ]; then
    let ntasks=$ngpus
fi

wrap=$@
if [ -z $exclude ]; then
    echo sbatch --partition=atlas --qos=normal --time=$time --job-name=$name \
         --mem="$mem"G --ntasks=$ntasks --gres=gpu:$ngpus --cpus-per-task=$cpus_per_task \
         --output=sample-%j.out --wrap="\"$wrap\""
    sbatch --partition=atlas --qos=normal --time=$time --job-name=$name \
           --mem="$mem"G --ntasks=$ntasks --gres=gpu:$ngpus --cpus-per-task=$cpus_per_task \
           --output=sample-%j.out --wrap="$wrap"
else
    echo sbatch --partition=atlas --qos=normal --time=$time --job-name=$name --exclude=atlas[$exclude] \
         --mem="$mem"G --ntasks=$ntasks --gres=gpu:$ngpus --cpus-per-task=$cpus_per_task \
         --output=sample-%j.out --wrap="\"$wrap\""
    sbatch --partition=atlas --qos=normal --time=$time --job-name=$name --exclude=atlas[$exclude] \
           --mem="$mem"G --ntasks=$ntasks --gres=gpu:$ngpus --cpus-per-task=$cpus_per_task \
           --output=sample-%j.out --wrap="$wrap"
fi
