#PATHA=/home/joel.chacon/Current/MyResearchTopics/Data_Dominance/StateOfTheArt_2/HV
PATHA=../HV/  #/home/joel.chacon/Current/MyResearchTopics/Data_Decomposition/StateOfTheArt/HV
for b in 1.0 0.5 0.25 0.125 0.0625 0.03125;

do
  #for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9 minusDTLZ1 minusDTLZ2 minusDTLZ3 minusDTLZ4 BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8;
  for i in BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8;
  do
    echo "--"${i}_2_$b; 
    for j in POF
    #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
    #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
    do
    echo ${PATHA}/${j}/${i}_2_$b
    done
  done
  
  #for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10  minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9 minusDTLZ1 minusDTLZ2 minusDTLZ3 minusDTLZ4 BT9;
  for i in BT9;
  
  do
    echo "--"${i}_3_$b; 
    #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
    #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
    for j in POF
    #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
    do
    echo ${PATHA}/${j}/${i}_3_$b
    done
  done
done
#
#
#
#PATHA=/home/joel.chacon/Current/MyResearchTopics/Data_Dominance/StateOfTheArt_2/IGD
#for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7;
#do
#  echo "--"${i}_2; 
#  for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
#  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
#  do
#  echo ${PATHA}/${j}/${i}_2
#  done
#done
#
#for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10;
#do
#  echo "--"${i}_3; 
#  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
#  for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
#  do
#  echo ${PATHA}/${j}/${i}_3
#  done
#done

exit;
PATHA=/home/joel.chacon/Current/MyResearchTopics/Data_Dominance/StateOfTheArt_2/IGDPlus
for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7;
do
  echo "--"${i}_2; 
  for j in MOEA-D-DE R2MOEA-DE VSD-MOEA-D-DE
  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
  do
  echo ${PATHA}/${j}/${i}_2
  done
done

for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10;
do
  echo "--"${i}_3; 
  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA VSD-MOEA-Archive SMS-EMOA
  for j in MOEA-D-DE R2MOEA-DE VSD-MOEA-D-DE
  #for j in GDE3 MOEA-D NSGAII R2-MOEA IBEA SMS-EMOA VSD-MOEA-eta-2 VSD-MOEA-eta-5
  do
  echo ${PATHA}/${j}/${i}_3
  done
done
