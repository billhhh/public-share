#!/bin/bash

# Configure the resources required
#SBATCH -p batch                                                # partition (this is the queue your job will be added to)
#SBATCH -N 1                                                    # set a given number of nodes
#SBATCH -n 1              	                                    # number of tasks (sequential job starts 1 task) (check this if your job unexpectedly uses 2 nodes)
#SBATCH -c 2              	                                    # number of cores (sequential job calls a multi-thread program that uses 2 cores)
#SBATCH --time=24:00:00                                         # time allocation, which has the format (D-HH:MM), here set to 24 hours (up to 48 hours)
#SBATCH --gres=gpu:1                                            # generic resource required (here requires 1 GPUs)
#SBATCH --mem=8GB                                              # specify memory required per node (here set to 8 GB)

# Configure notifications 
#SBATCH --mail-type=END                                         # Type of email notifications will be sent (here set to END, which means an email will be sent when the job is done)
#SBATCH --mail-type=FAIL                                        # Type of email notifications will be sent (here set to FAIL, which means an email will be sent when the job is fail to complete)
#SBATCH --mail-user=axxx@gmail.com                    # Email to which notification will be sent

# record GPU utilisation
nvidia-smi -l > nv-smi_sa.log.${SLURM_JOB_ID} 2>&1 &

# Execute your script (due to sequential nature, please select proper compiler as your script corresponds to)
python ./main.py
