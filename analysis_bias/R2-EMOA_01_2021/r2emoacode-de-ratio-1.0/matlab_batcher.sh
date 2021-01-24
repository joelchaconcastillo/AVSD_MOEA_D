#!/bin/sh
unset MATLAB_JAVA
matlab_exec=/home/joel.chacon/MATLAB_2016_Portable/bin/matlab
path=/home/joel.chacon/2021_Decomposition/AVSD_MOEA_D/analysis_bias/R2-EMOA_01_2021/r2emoacode-de-ratio-1.0
#sleep $((RANDOM % 20))
X="${1}(${3})"
echo ${X} > ${path}/matlab_command_${2}.m
cat ${path}/matlab_command_${2}.m
cd ${path};
${matlab_exec} -nojvm < ${path}/matlab_command_${2}.m > kk &
wait
#${matlab_exec} -nojvm -nodisplay -nosplash < ${path}/matlab_command_${2}.m 
rm ${path}/matlab_command_${2}.m
