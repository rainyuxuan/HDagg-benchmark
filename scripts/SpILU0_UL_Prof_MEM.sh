#!/bin/bash
#SBATCH --account=def-mmehride
#SBATCH --job-name="SpILU0_Prof_MEM"
#SBATCH --output="SpILU0_Prof_MEM_%j.out"
#SBATCH --error="SpILU0_Prof_MEM_%j.error"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --export=ALL
#SBATCH -t 12:00:00
#SBATCH --constraint=cascade


source init_env_var.sh
export OMP_NUM_THREADS=20
export MKL_NUM_THREADS=20
SOURCE_DIR=$(pwd)
echo "Start SpILU0 Memory Analysis"
cd ${SOURCE_DIR}/build/example
rm -rf SpILU0_PAPI_MEM.csv
for sparse_mat in matrix/*.mtx;
do
    echo "Processing ${sparse_mat}"
    ./SpILU0_Final_PAPI_MEM ${sparse_mat}
done
