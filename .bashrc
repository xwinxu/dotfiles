#!/bin/bash

# =============================================================================
#  Navigation & File Operations
# =============================================================================
alias l='ls'
alias ll='ls -al'
alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias desk='cd ~/Desktop/'
alias down='cd ~/Downloads/'

# Search
alias search='grep -rnw . -e'  # search for a string in all files
alias fnempty='find -L . ! -size 0'  # list non-empty files
alias nemptyc='fnempty | wc -l'  # count non-empty files

# =============================================================================
#  Git Commands
# =============================================================================
alias ga='git add'
alias cm='git commit -m'
alias gc='git commit -m'
alias gp='git push'
alias ph='git push'
alias pho='git push origin'
alias pl='git pull'
alias plo='git pull origin'
alias st='git status'
alias br='git branch'
alias ck='git checkout'

# =============================================================================
#  Remote Storage & Mounting
# =============================================================================
alias gsls='gsutil ls'
alias gscat='gsutil cat'
alias fumount='sudo diskutil umount force ~/mtpt'
alias fmount='sshfs winniexu@v.vectorinstitute.ai:/scratch/ssd001/home/winniexu/ /Users/winniexu/mtpt/'
alias ckmount='sshfs winniexu@v.vectorinstitute.ai:/checkpoint/winniexu/icml/ /Users/winniexu/ckpt/'
alias ckumount='sudo diskutil umount force ~/ckpt'
alias vec1='cd ~/vec1home/'
alias ck='cd /checkpoint/winniexu/'

# =============================================================================
#  SLURM Commands
# =============================================================================
# Status and Information
alias gpuavail='sgpu -g atlas'
alias pstatu='pestat -u winniexu'
alias squ='squeue -u $USER --format="%.8F %.6P %.50j %.2t %.10M %.6D %.8N %.6b %.15E" --sort=+i'
alias sq='squeue --format="%.8F %.6P %.10u %.50j %.2t %.10M %.6D %.8N %.6b %.15E"'
alias sqc='squeue | grep -c winniexu'  # count total jobs
alias sqr='squ | grep " R " | wc -l'   # count running jobs
alias sqp='squ | grep -c PD'           # count pending jobs
alias wat='watch -n 5'
alias moni='squeue -u $USER --format="%.8F %.6P %.50j %.2t %.10M %.6D %.8N %.6b %.15E" --sort=+i'

# Job Management
alias scan='scancel -u winniexu'
alias statu='sacct -u winniexu'
alias sjob='sacct --format="JobID,JobName%-45,AllocCPUS%-2,Start,End,State,ExitCode%-3"'
alias check='/usr/local/bin/sacct --format=jobid%-6,jobname%-45,state%2,allocgres%.5,start,end,elapsed,node%-6,qos%-4 -X -n -T --duplicates -u winniexu'
alias checkjobs='/usr/local/bin/sacct --format=user%-5,jobid%-7,jobname%-118,state%-5,allocgres%-6,start,end,elapsed,node%-6,qos%-4 -X -n -T --duplicates -u winniexu'
alias chek='sacct --format=jobidraw,jobname,user,allocgres,submit,start,end,elapsed,state,partition -D -X -j'

# Interactive Sessions
alias sint='srun --gres=gpu:1 --mem=40G -p interactive -q nopreemption --pty bash'
alias sintrtx='srun --gres=gpu:1 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintrtx2='srun --gres=gpu:2 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintrtx4='srun --gres=gpu:4 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintcpu='srun -p cpu --qos nopreemption --mem 40G --mincpu 4 --pty bash'
alias srcpu='srun -p cpu --qos nopreemption --mem 40G --mincpu 4 --pty bash'

# GPU Job Submission
alias sr='srun --gres=gpu:1 --mem=24G -p p100'
alias srt4='srun --gres=gpu:1 --mem=20G -p t4v1'
alias sr2='srun --gres=gpu:1 --mem=20G -p p100'
alias sr2t4='srun --gres=gpu:1 --mem=28G -p t4v2 -q normal'
alias sb='sbatch --gres=gpu:1 -p p100 --mem=8G'

# Non-shell allocations with manual join
alias salc1="salloc --no-shell --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=5 --gres=gpu:1 --time=12:00:00 bash"
alias salc2="salloc --no-shell --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=10 --gres=gpu:2 --time=12:00:00 bash"

# For launching sbatch inside an interactive allocation
alias sbatch_anywhere="SLURM_STEP_NUM_TASKS= SLURM_JOB_USER= SLURM_TASKS_PER_NODE= SLURM_JOB_UID= SLURM_STEP_GPUS= SLURM_CPU_BIND= SLURM_TASK_PID= SLURM_LOCALID= SLURM_CPU_BIND_VERBOSE= SLURMD_NODENAME= SLURM_JOB_START_TIME= SLURM_STEP_NODELIST= SLURM_JOB_END_TIME= SLURM_CPUS_ON_NODE= SLURM_UMASK= SLURM_JOB_CPUS_PER_NODE= SLURM_GPUS_ON_NODE= SLURM_GTIDS= SLURM_JOB_PARTITION= SLURM_STEPID= SLURM_CPU_BIND_LIST= SLURM_JOBID= SLURM_PTY_PORT= SLURM_LAUNCH_NODE_IPADDR= SLURM_PTY_WIN_ROW= SLURM_CPU_BIND_TYPE= SLURMD_DEBUG= SLURM_PROCID= SLURM_NTASKS= SLURM_TOPOLOGY_ADDR= SLURM_DISTRIBUTION= SLURM_TOPOLOGY_ADDR_PATTERN= SLURM_SRUN_COMM_HOST= SLURM_WORKING_CLUSTER= SLURM_PTY_WIN_COL= SLURM_NODELIST= SLURM_SRUN_COMM_PORT= SLURM_STEP_ID= SLURM_PRIO_PROCESS= SLURM_NPROCS= SLURM_NNODES= SLURM_JOB_ID= SLURM_NODEID= SLURM_STEP_NUM_NODES= SLURM_STEP_TASKS_PER_NODE= SLURM_CONF= SLURM_JOB_NAME= SLURM_STEP_LAUNCHER_PORT= SLURM_JOB_GID= SLURM_JOB_NODELIST= sbatch"

# =============================================================================
#  Tmux
# =============================================================================
alias tmls='tmux list-sessions'
alias tmuxa='tmux new -A -s'  # create or attach to session
alias tmuxn='tmux new-session -s'
alias tmuxk='tmux kill-session -t'

# =============================================================================
#  TensorBoard
# =============================================================================
alias tb='tensorboard --bind_all --port 2002 --logdir'
alias tb2='tensorboard --bind_all --port 2003 --logdir'
alias tbd='sr2 tensorboard dev upload --logdir'
alias tbdev='tensorboard dev upload --logdir'
alias tbvec1='ssh vec1 -NL 2002:vremote:2002'
alias tbvec2='ssh vec2 -NL 2003:v:2003'

# =============================================================================
#  Development Tools
# =============================================================================
alias pythonb='python -m pdb -c continue'
alias julia='/Applications/Julia-1.3.app/Contents/Resources/julia/bin/julia'
alias src='source ~/.bashrc'

# Error finding
alias greper='grep -rli "Error"'
alias greptr='grep -rli "Traceback"'
alias grepex='grep -v "\.slrm"'

# Join an existing SLURM job
function joinjob() { 
    srun --overlap --pty --jobid "$1" bash
}

# Custom prompt with status indicator
PS1='\h\[\e[36m\] λ\[\e[36m\]\w `if [ $? = 0 ]; then echo \[\e[33m\]:\)\[\e[37m\]; else echo \[\e[35m\]:\(\[\e[37m\]; fi` '
