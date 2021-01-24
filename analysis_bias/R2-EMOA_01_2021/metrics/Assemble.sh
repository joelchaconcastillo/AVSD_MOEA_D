#PATH1=../POF
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
#do
#   for sed in {1..35}   
#   do
#   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed*_nobj_2* > POF/${instance}_2_${sed}
#   done
#done
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
#do
#   for sed in {1..35}   
#   do
#   tail -100 $PATH1/POF_MOEAD_${instance}_RUN${sed}_seed*_nobj_3* > POF/${instance}_3_${sed}
#   done
#done

#PATH1=../r2-moea-general/
#
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
#do
#   for sed in {1..35}
#   do
#   cat $PATH1/${instance}_2_${sed}_*[!R] | tail -100 > R2-EMOA/${instance}_2_${sed}
#   done
#done
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
#do
#   for sed in {1..35}
#   do
#   cat $PATH1/${instance}_3_${sed}_*[!R] | tail -100 > R2-EMOA/${instance}_3_${sed}
#   done
#done

PATH1=../Results
#for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8 minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9 minusDTLZ1 minusDTLZ2 minusDTLZ3 minusDTLZ4
for b in 1.0 0.5 0.25 0.125 0.0625 0.03125 0.015625 0.0078125 0.00390625 0.001953125 0.000976562;
do
  for instance in BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8 
  do
     for sed in {1..35}
     do

   cat $PATH1/${instance}_2_${sed}_*_$b | tail -100 > POF/${instance}_2_${sed}_$b
#     tail -100 $PATH1/v2_POF_MOEAD_${instance}_RUN${sed}_seed_*nobj_2*CR_0.0*_F_*0.75*_$b | cut -f1,2 -d' '  > POF/${instance}_2_${sed}_$b
     done
  done
  #for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10 BT9 minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9 minusDTLZ1 minusDTLZ2 minusDTLZ3 minusDTLZ4
  for instance in BT9;
  do
     for sed in {1..35}
     do
   cat $PATH1/${instance}_3_${sed}_*_$b | tail -100 > POF/${instance}_3_${sed}_$b
#     tail -100 $PATH1/v2_POF_MOEAD_${instance}_RUN${sed}_seed_*nobj_3*CR_0.0*_F_*0.75*_$b | cut -f1,2,3 -d' '  > POF/${instance}_3_${sed}_$b
     done
  done
done
#PATH1=../nsgaii-general
#
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF1 UF2 UF3 UF4 UF5 UF6 UF7 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAII_SBX_POLYNOMIAL_EVALUATIONS_*_${instance}_SEED_${sed}_2.txt | tail -100 > NSGA-II/${instance}_2_${sed}
#      done
#   done
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF8 UF9 UF10 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAII_SBX_POLYNOMIAL_EVALUATIONS_*_${instance}_SEED_${sed}_3.txt | tail -100 > NSGA-II/${instance}_3_${sed}
#      done
#   done
#
#PATH1=../nsgaiii-general
#
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF1 UF2 UF3 UF4 UF5 UF6 UF7 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAIII_SBX_*_${instance}_SEED_${sed}_2_vars* | tail -100 > NSGA-III/${instance}_2_${sed}
#      done
#   done
#   for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF8 UF9 UF10 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7
#   do
#      for sed in {1..35}
#      do
#      cat $PATH1/OBJ_NSGAIII_SBX_*_${instance}_SEED_${sed}_3_vars* | tail -100 > NSGA-III/${instance}_3_${sed}
#      done
#   done

