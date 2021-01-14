#algname=(GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA-eta-2 VSD-MOEA-eta-5 SMS-EMOA)
#algname=(MOEA-D NSGA-II NSGA-III R2-EMOA VSD-MOEA-D)
algname=(POF)
for b in 1.0 0.5 0.25 0.125 0.0625 0.03125;
do
##Calculating the HV considering plus 10% for each objective
   cont=0
#for alg in GDE3/POF MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF IBEA/SBX/POF VSD-MOEA-eta-2/SBX/POF VSD-MOEA-eta-5/SBX/POF SMS-EMOA/SBX/POF
#for alg in MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF VSD-MOEA-eta-2-clean/SBX/POF
  for alg in ${algname[@]}
  do
  for i in BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8;
    do
	    rm ${algname[$cont]}/${i}_2_$b

	   for file in ../$alg/${i}_2*_$b
	   do
	      v1=$(./hv -r "1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_$b
              echo "" >>${algname[${cont}]}/${i}_2_$b
	   done
   done

#################3obj
    for i in BT9;
    do
	    rm ${algname[$cont]}/${i}_3_$b

	   for file in ../$alg/${i}_3*_$b
	   do
	      v1=$(./hv -r "1.1 1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_$b
              echo "" >>${algname[${cont}]}/${i}_3_$b
#	      ./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   cont=$((cont+1))
  done
done
