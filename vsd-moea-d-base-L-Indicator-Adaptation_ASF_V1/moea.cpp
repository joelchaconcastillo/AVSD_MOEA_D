/*==========================================================================
//  C++ Implementation of MOEA/D Based on Differential Evolution (DE) for Contest Multiobjective
//  Problems in CEC2009
//
//  Author: Hui Li
//
//  See the details of MOEA/D-DE and test problems in the following papers
//
//  1) H. Li and Q. Zhang, Comparison Between NSGA-II and MOEA/D on a Set of Multiobjective Optimization
//  Problems with Complicated Pareto Sets, Technical Report CES-476, Department of Computer Science,
//  University of Essex, 2007
//
//  2) H. Li and Q. Zhang, Multiobjective Optimization Problems with Complicated Pareto Sets, MOEA/D and NSGA-II,
//  IEEE Transaction on Evolutionary Computation, 2008, to appear.
//
//  If you have any questions about the codes, please contact
//  Dr. Hui Li       at   hzl@cs.nott.ac.uk   or
//  Dr. Qingfu Zhang at   qzhang@essex.ac.uk
//
//  Date: 14/NOV/2008
//
// ===========================================================================*/



#include "algorithm.h"
#include <omp.h>

void InitializeBounds(int nvar, char * Instance)
{
	if( !strcmp("UF1", Instance) || !strcmp("UF2", Instance) || !strcmp("UF3", Instance) || !strcmp("UF4", Instance) || !strcmp("UF5", Instance) || !strcmp("UF6", Instance) || !strcmp("UF7", Instance) || !strcmp("UF8", Instance) || !strcmp("UF9", Instance) || !strcmp("UF10", Instance) || !strcmp("BT1", Instance) || !strcmp("BT2", Instance) || !strcmp("BT3", Instance) || !strcmp("BT4", Instance) || !strcmp("BT5", Instance) || !strcmp("BT6", Instance) || !strcmp("BT8", Instance) || !strcmp("BT9", Instance))

	{
		for(int i = 0 ;  i < nvar; i++)
		{
		   vlowBound[i]=0.0;
		   vuppBound[i]=1.0;//2.0*(i+1.0);
		}
	}
        if(!strcmp("BT7", Instance))
	{
		vlowBound[0]=0.0;
		vuppBound[0]=1.0;
		for(int i = 1 ;  i < nvar; i++)
		{
		   vlowBound[i]=-1.0;
		   vuppBound[i]=1.0;
		}
	}
	if( !strcmp("WFG1", Instance) || !strcmp("WFG2", Instance) || !strcmp("WFG3", Instance) || !strcmp("WFG4", Instance) || !strcmp("WFG5", Instance) || !strcmp("WFG6", Instance) || !strcmp("WFG7", Instance) || !strcmp("WFG8", Instance) || !strcmp("WFG9", Instance) || !strcmp("minusWFG1", Instance) || !strcmp("minusWFG2", Instance) || !strcmp("minusWFG3", Instance) || !strcmp("minusWFG4", Instance) || !strcmp("minusWFG5", Instance) || !strcmp("minusWFG6", Instance) || !strcmp("minusWFG7", Instance) || !strcmp("minusWFG8", Instance) || !strcmp("minusWFG9", Instance))
	{
		for(int i = 0 ;  i < nvar; i++)
		{
		   vlowBound[i]=0.0;
		   vuppBound[i]=2.0*(i+1.0);
		}
	}
	if( !strcmp("DTLZ1", Instance) || !strcmp("DTLZ2", Instance) || !strcmp("DTLZ3", Instance) || !strcmp("DTLZ4", Instance) || !strcmp("DTLZ5", Instance) || !strcmp("DTLZ6", Instance) || !strcmp("DTLZ7", Instance) || !strcmp("minusDTLZ1", Instance) || !strcmp("minusDTLZ2", Instance) || !strcmp("minusDTLZ3", Instance) || !strcmp("minusDTLZ4", Instance))
	{
		for(int i = 0 ;  i < nvar; i++)
		{
		   vlowBound[i]=0.0;
		   vuppBound[i]=1.0;
		}
	}
	if( !strcmp("RWP1", Instance))
        {
                for(int i = 0 ;  i < nvar; i++)
                {
                   vlowBound[i]=0.0;
                   vuppBound[i]=1.0;
                }
        }
        if( !strcmp("RWP2", Instance))
        {
                for(int i = 0 ;  i < nvar; i++)
                {
                   vlowBound[i]=1.0;
                   vuppBound[i]=3.0;
                }
        }

}
int main(int argc, char *argv[])
{

	int index = 1;
	int run = 1;
	strcpy(strpath, argv[index++]);
	strcpy(strTestInstance, argv[index++]);
	run= atoi(argv[index++]);
	nobj = atoi(argv[index++]);
	pops = atoi(argv[index++]);
	nWeights = atoi(argv[index++]);
	max_nfes= atoll(argv[index++]);
	CR = atof(argv[index++]);
	F = atof(argv[index++]);
	if(argc <= index+3)
	{
	   nvar = atoi(argv[index++]);
	 
	}
	else
	{
	   param_l = atoi(argv[index++]);
	   param_k = atoi(argv[index++]);
	   nvar = param_l + param_k;
	}
	Di = sqrt(nvar)*atof(argv[index++]);
	Df = atof(argv[index++]);
	InitializeBounds(nvar, strTestInstance);

	CMOEAD MOEAD;
	MOEAD.exec_emo(run);
}
