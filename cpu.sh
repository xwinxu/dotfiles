#!/bin/bash

srun --partition=atlas-interactive --gres=gpu:0 --cpus-per-task=8 --time=12:00:00 --pty bash
. ~/jax.env
