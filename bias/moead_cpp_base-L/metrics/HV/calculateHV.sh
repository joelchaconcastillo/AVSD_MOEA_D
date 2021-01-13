#algname=(GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA-eta-2 VSD-MOEA-eta-5 SMS-EMOA)
#algname=(MOEA-D NSGA-II NSGA-III R2-EMOA VSD-MOEA-D)
algname=(POF)
##Calculating the HV considering plus 10% for each objective
   cont=0
#for alg in GDE3/POF MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF IBEA/SBX/POF VSD-MOEA-eta-2/SBX/POF VSD-MOEA-eta-5/SBX/POF SMS-EMOA/SBX/POF
#for alg in MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF VSD-MOEA-eta-2-clean/SBX/POF
for alg in ${algname[@]}
do
#   alg=($alg"/POF/")
   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9;
   do
	   rm ${algname[$cont]}/${i}_2

	   for file in ../$alg/${i}_2*
	   do
 	      v1=$(./hv -r "2.2 4.4" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2.2 4.4" ../Optimals/${i}_2.txt )
             echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
            echo "" >>${algname[${cont}]}/${i}_2
	   done
   done
    for i in DTLZ2 DTLZ3 DTLZ4 UF1 UF2 UF3 UF4 UF5 UF6 UF7 BT1 BT2 BT3 BT4 BT5 BT6 BT7 BT8 DTLZ5 DTLZ6;
    do
	    rm ${algname[$cont]}/${i}_2

	   for file in ../$alg/${i}_2*
	   do
	      v1=$(./hv -r "1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
	   done
   done

   i=DTLZ1
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "0.55 0.55" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "0.55 0.55" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2

   done

   i=DTLZ7
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "1.1 4.4" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 4.4" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done
   i=minusDTLZ1
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "611.05 611.05" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "611.05 611.05" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done
   i=minusDTLZ1
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "611.05 611.05 611.05" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "611.05 611.05 611.05" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
   done

   i=minusDTLZ2
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "3.85 3.85" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "3.85 3.85" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done
   i=minusDTLZ2
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "3.85 3.85 3.85" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "3.85 3.85 3.85" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
   done

   i=minusDTLZ3
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "2442 2442" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2442 2442" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done
   i=minusDTLZ3
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "2442 2442 2442" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2442 2442 2442" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
   done

   i=minusDTLZ4
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
	      v1=$(./hv -r "3.85 3.85" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "3.85 3.85" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done
   i=minusDTLZ4
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "3.85 3.85 3.85" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "3.85 3.85 3.85" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
   done

#################3obj
   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 minusWFG1 minusWFG2 minusWFG3 minusWFG4 minusWFG5 minusWFG6 minusWFG7 minusWFG8 minusWFG9;
   do
	   rm ${algname[$cont]}/${i}_3

	   for file in ../$alg/${i}_3*
	   do
	      v1=$(./hv -r "2.2 4.4 6.6" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2.2 4.4 6.6" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3

#	      ./hv -r "2.2 4.4 6.6" $file >>${algname[${cont}]}/${i}_3
	   done
   done

    for i in DTLZ2 DTLZ3 DTLZ4 UF8 UF9 UF10 BT9;
    do
	    rm ${algname[$cont]}/${i}_3

	   for file in ../$alg/${i}_3*
	   do
	      v1=$(./hv -r "1.1 1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
#	      ./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   i=DTLZ1
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "0.55 0.55 0.55" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "0.55 0.55 0.55" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
#      ./hv -r "0.55 0.55 0.55" $file >>${algname[${cont}]}/${i}_3
   done
        value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
        reference="$value $value 1.1"
  for i in DTLZ5 DTLZ6;
	do
		rm ${algname[$cont]}/${i}_3
	  # value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
	   for file in ../$alg/${i}_3*
	   do
	   #./hv -r "${value} ${value}" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "$reference" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "$reference" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
	   #./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   i=DTLZ7
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "1.1 1.1 6.6" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 6.6" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
      #./hv -r "1.1 1.1 6.6" $file >>${algname[${cont}]}/${i}_3
   done

   cont=$((cont+1))
done
