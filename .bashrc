# slurm
alias gpuavail='sgpu -g atlas' # --verbose
alias pstatu='pestat -u winniexu'
alias search='grep -rnw . -e' # search for a string in all files
# showalloc <partition>

# works if not using tmux, must manually join each job id and will be persistent on ssh disconnect
alias salc1="salloc --no-shell --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=5 --gres=gpu:1 --time=12:00:00 bash"
alias salc2="salloc --no-shell --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=10 --gres=gpu:2 --time=12:00:00 bash"
function joinjob() { srun --overlap --pty --jobid "$1" bash; }
# works if using tmux
alias sint1="srun --pty --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=5 --gres=gpu:1 --time=12:00:00 bash"
alias sint2="srun --pty --partition=g2dev --nodes=1 --ntasks-per-node=1 --cpus-per-task=10 --gres=gpu:2 --time=12:00:00 bash"

# general
alias ll='ls -al'
alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias l='ls'
alias cm='git commit -m'
alias ad='git add'
alias ck='git checkout'
alias br='git branch'
alias ph='git push'
alias pho='git push origin'
alias pl='git pull'
alias plo='git pull origin'
alias st='git status'
alias gsls='gsutil ls'
alias gscat='gsutil cat'
alias desk='cd ~/Desktop/'
alias down='cd ~/Downloads/'
alias vec1='cd ~/vec1home/'
alias fumount='sudo diskutil umount force ~/mtpt'
alias fmount='sshfs winniexu@v.vectorinstitute.ai:/scratch/ssd001/home/winniexu/ /Users/winniexu/mtpt/'
#alias ckmount='sshfs winniexu@v.vectorinstitute.ai:/checkpoint/winniexu/ /Users/winniexu/ckpt/'
alias ckmount='sshfs winniexu@v.vectorinstitute.ai:/checkpoint/winniexu/icml/ /Users/winniexu/ckpt/'
# launch sbatch / salloc inside an interactive slurm allocation (not login node) and prevent cpu bind request error:
alias sbatch_anywhere="SLURM_STEP_NUM_TASKS= SLURM_JOB_USER= SLURM_TASKS_PER_NODE= SLURM_JOB_UID= SLURM_STEP_GPUS= SLURM_CPU_BIND= SLURM_TASK_PID= SLURM_LOCALID= SLURM_CPU_BIND_VERBOSE= SLURMD_NODENAME= SLURM_JOB_START_TIME= SLURM_STEP_NODELIST= SLURM_JOB_END_TIME= SLURM_CPUS_ON_NODE= SLURM_UMASK= SLURM_JOB_CPUS_PER_NODE= SLURM_GPUS_ON_NODE= SLURM_GTIDS= SLURM_JOB_PARTITION= SLURM_STEPID= SLURM_CPU_BIND_LIST= SLURM_JOBID= SLURM_PTY_PORT= SLURM_LAUNCH_NODE_IPADDR= SLURM_PTY_WIN_ROW= SLURM_CPU_BIND_TYPE= SLURMD_DEBUG= SLURM_PROCID= SLURM_NTASKS= SLURM_TOPOLOGY_ADDR= SLURM_DISTRIBUTION= SLURM_TOPOLOGY_ADDR_PATTERN= SLURM_SRUN_COMM_HOST= SLURM_WORKING_CLUSTER= SLURM_PTY_WIN_COL= SLURM_NODELIST= SLURM_SRUN_COMM_PORT= SLURM_STEP_ID= SLURM_PRIO_PROCESS= SLURM_NPROCS= SLURM_NNODES= SLURM_JOB_ID= SLURM_NODEID= SLURM_STEP_NUM_NODES= SLURM_STEP_TASKS_PER_NODE= SLURM_CONF= SLURM_JOB_NAME= SLURM_STEP_LAUNCHER_PORT= SLURM_JOB_GID= SLURM_JOB_NODELIST= sbatch"
alias ckumount='sudo diskutil umount force ~/ckpt'
alias tbvec1='ssh vec1 -NL 2002:vremote:2002'
alias tbvec2='ssh vec2 -NL 2003:v:2003'
# tensorboard --logdir_spec=1:gs://   
alias tbdev='tensorboard dev upload --logdir'
# alias tmuxa='tmux attach-session -t'
# create or attach new session
alias tmuxa='tmux new -A -s'
alias tmuxn='tmux new-session -s'
alias tmuxk='tmux kill-session -t'
alias pythonb='python -m pdb -c continue'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias src='source ~/.bashrc'
# scp -r winniexu@address.com:~/some_dir ~/Desktop/destination_dir
alias julia='/Applications/Julia-1.3.app/Contents/Resources/julia/bin/julia'

# \u@\h
PS1='\h\[\e[36m\] λ\[\e[36m\]\w `if [ $? = 0 ]; then echo \[\e[33m\]:\)\[\e[37m\]; else echo \[\e[35m\]:\(\[\e[37m\]; fi` '

alias ck='cd /checkpoint/winniexu/'
# watch -n 5 "squeue -u $USER --format='%.8F %5P %.60j %.2t %.5M %.5D %.5N %.5b %.3E' --sort=+i | grep <>"
# /usr/local/bin/sacct --format=user,jobid,jobname,state,allocgres,start,end,elapsed,node,qos -X -n -T --duplicates -u winniexu -S 2020-05-19T17:30
alias chek='sacct  --format=jobidraw,jobname,user,allocgres,submit,start,end,elapsed,state,partition -D -X -j'
# tmux attach
alias tmls='tmux list-sessions'
alias tmuxa='tmux attach-session -t'
# srun (-q deadline all except rtx6000)
alias sr='srun --gres=gpu:1 --mem=24G -p p100 ' # -q nopreemption '
alias srt4='srun --gres=gpu:1 --mem=20G -p t4v1' # -q nopreemption '
alias sr2='srun --gres=gpu:1 --mem=20G -p p100 ' # -q nopreemption '
alias srcpu='srun -p cpu --qos nopreemption --mem 40G --mincpu 4 --pty bash'
alias sr2t4='srun --gres=gpu:1 --mem=28G -p t4v2 -q normal ' # preemption
alias sint='srun --gres=gpu:1 --mem=40G -p interactive -q nopreemption --pty bash '
alias sintrtx='srun --gres=gpu:1 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintrtx2='srun --gres=gpu:2 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintrtx4='srun --gres=gpu:4 --mem=40G -p rtx6000 -q normal --pty bash'
alias sintcpu='srun -p cpu --qos nopreemption --mem 40G --mincpu 4  --pty bash'
# sbatch, squeue
alias sb='sbatch --gres=gpu:1 -p p100 --mem=8G '
alias sq='squeue --format="%.8F %.6P %.10u %.50j %.2t %.10M %.6D %.8N %.6b %.15E"'
# squeue user
alias squ='squeue -u $USER --format="%.8F %.6P %.50j %.2t %.10M %.6D %.8N %.6b %.15E" --sort=+i'
# count number of jobs 
alias sqc='squeue | grep -c winniexu'
# count number of jobs running
alias sqr='squ | grep " R " | wc -l'
#alias sqr='squ | grep -c RUN'
alias sqp='squ | grep -c PD'
# cancel all jobs
alias scan='scancel -u winniexu'
alias sjob='sacct --format="JobID,JobName%-45,AllocCPUS%-2,Start,End,State,ExitCode%-3"'
alias checkjob='/usr/local/bin/sacct --format=user,jobid,state,allocgres,start,end,elapsed,node,qos -X -n  -T  --duplicates -u winniexu' # -E 2020-05-15T12:30 -S 2020-05-14T00:00 -j <job_id>
alias checkjobs='/usr/local/bin/sacct --format=user%-5,jobid%-7,jobname%-118,state%-5,allocgres%-6,start,end,elapsed,node%-6,qos%-4 -X -n  -T  --duplicates -u winniexu' 
alias checkjobslong='/usr/local/bin/sacct --format=user%-5,jobid%-7,jobname%-120,state%-5,allocgres%-6,start,end,elapsed,node%-6,qos%-4 -X -n  -T  --duplicates -u winniexu' 
alias check='/usr/local/bin/sacct --format=jobid%-6,jobname%-45,state%2,allocgres%.5,start,end,elapsed,node%-6,qos%-4 -X -n -T --duplicates -u winniexu'
alias wat='watch -n 5'

# grep for Errors and failures e.g. greper . | grepex
alias grepex='grep -v "\.slrm"'
alias greper='grep -rli "Error"' 
alias greptr='grep -rli "Traceback"'
alias statu='sacct -u winniexu'
alias wat='watch -n 5 '
alias moni='squeue -u $USER --format="%.8F %.6P %.50j %.2t %.10M %.6D %.8N %.6b %.15E" --sort=+i'
# list non-empty
alias fnempty='find -L . ! -size 0'
# count non empty
alias nemptyc='fnempty | wc -l'
# tensorboard
alias tb='tensorboard --bind_all --port 2002 --logdir '
alias tbd='sr2 tensorboard dev upload --logdir '
alias tbdev='tensorboard dev upload --logdir '
alias tb2='tensorboard --bind_all --port 2003 --logdir '


# alias auto='ssh od@128.100.201.39 -p 10023' # for specific port forwarded tensorboard
# alias autotensor='ssh od@128.100.201.39 -p 10023 -L localhost:16008:logstar:6008'
# alias autoim='ssh -X -p 10023 od@128.100.201.39' # for XQuartz
