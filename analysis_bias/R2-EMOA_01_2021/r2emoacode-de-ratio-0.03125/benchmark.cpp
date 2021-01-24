#include "mex.h"
#include <errno.h>
#include <stdlib.h>
#include <vector>
#include <stdio.h>
#include <string.h>
#include "problem.cpp"
#include <ctype.h> /* for isspace() */
/* #define VARIANT 4 */
//int param_k = 4, param_l = 20;
//int nobj = 2;
////mex -I. benchmark.cpp cec09.cpp Toolkit/ExampleProblems.cpp Toolkit/ExampleShapes.cpp Toolkit/ExampleTransitions.cpp Toolkit/FrameworkFunctions.cpp Toolkit/Misc.cpp Toolkit/ShapeFunctions.cpp Toolkit/TransFunctions.cpp

using namespace std;
int stop_dimension = 1; /* default: stop on dimension 2 */


void benchmark(double *, double *,int,int,int,int);

//nlhs: number of output arguments..
//plhs: arrays
//nrhs: number of input arguments..
//prhs: arrays
void mexFunction( int nlhs, mxArray *plhs[] , int nrhs, const mxArray *prhs[] )
{
    int  m, n,func_num, nobj;
    double  *f, *x;
     n = mxGetN (prhs[0]); //get number of individuals
     m = mxGetM (prhs[0]); //get number of variables
     x = mxGetPr (prhs[0]); //get individuals...
     func_num= (int)*mxGetPr (prhs[1]); //get the number of function
     nobj = (int)*mxGetPr (prhs[2]); //get the number of objectives
     plhs[0] = mxCreateDoubleMatrix (n, nobj, mxREAL); // 
     f = mxGetPr (plhs[0]);

     benchmark(&x[0], &f[0], n,m,func_num, nobj);

//	double * volume;
//	double * data, * reference;
//	unsigned int row, col, row_r, col_r;
//	const int  *dims, *dims_r;
//    
//    	data = mxGetPr(prhs[0]);
//	dims = mxGetDimensions(prhs[0]);
//    /* ATTENTION: please transpose the pf matrix!!! */
//	row = dims[1];
//	col = dims[0];
//
//    reference = mxGetPr(prhs[1]);
//	dims_r = mxGetDimensions(prhs[1]);
//	row_r = dims_r[0];
//	col_r = dims_r[1];
//    
//    if((col != col_r) || (row_r != 1))
//    {
//	    printf("\n size-pf: %d x %d  size-ref: %d x %d", row, col, row_r, col_r);
//	    printf("\n ATTENTION: please transpose the pf matrix!!!");
//	    printf("\nsynopsis:   volume = hv(paretofront', reference_point)");
//	    plhs[0]    = mxCreateDoubleMatrix(0 , 0 ,  mxREAL);
//	    return;
//    }
//    
//    /* ----- output ----- */
//
//	plhs[0]    = mxCreateDoubleMatrix (1 , 1, mxREAL);
//	volume = (double *) mxGetPr(plhs[0]);
//	
//	
//	/* main call */
////	(*volume) = hypervolume(data, reference, col, row);
}
void benchmark(double *x, double *f, int nx, int mx,int func_num, int nobj)
{
   double ratio = 0.03125;
   for(int i = 0; i < nx; i++)
      {
	 vector<double> X( x+i*mx, x + (i+1)*mx );
	 vector<double> F( nobj, 0.0);
	    // dtlz1(F,X);
	 switch(func_num)
	{
	   case 1:
	     dtlz1(F,X);
	     break;
	   case 2:
	     dtlz2(F,X);
	     break;
	   case 3:
	     dtlz3(F,X);
	     break;
	   case 4:
	     dtlz4(F,X);
	     break;
	   case 5:
	     dtlz5(F,X);
	     break;
	   case 6:
	     dtlz6(F,X);
	     break;
	   case 7:
	     dtlz7(F,X);
	     break;
	   case 8:
	     wfg1(F,X);
	     break;
	   case 9:
	     wfg2(F,X);
	     break;
	   case 10:
	     wfg3(F,X);
	     break;
	   case 11:
	     wfg4(F,X);
	     break;
	   case 12:
	     wfg5(F,X);
	     break;
	   case 13:
	     wfg6(F,X);
	     break;
	   case 14:
	     wfg7(F,X);
	     break;
	   case 15:
	     wfg8(F,X);
	     break;
	   case 16:
	     wfg9(F,X);
	     break;
	   case 17:
	     CEC09_F1(F,X);
	     break;
	   case 18:
	     CEC09_F2(F,X);
	     break;
	   case 19:
	     CEC09_F3(F,X);
	     break;
	   case 20:
	     CEC09_F4(F,X);
	     break;
	   case 21:
	     CEC09_F5(F,X);
	     break;
	   case 22:
	     CEC09_F6(F,X);
	     break;
	   case 23:
	     CEC09_F7(F,X);
	     break;
	   case 24:
	     CEC09_F8(F,X);
	     break;
	   case 25:
	     CEC09_F9(F,X);
	     break;
	   case 26:
	     CEC09_F10(F,X);
	     break;
	   case 27:
	     bt1(F,X, ratio);
	     break;
	   case 28:
	     bt2(F,X, ratio);
	     break;
	   case 29:
	     bt3(F,X, ratio);
	     break;
	   case 30:
	     bt4(F,X, ratio);
	     break;
	   case 31:
	     bt5(F,X, ratio);
	     break;
	   case 32:
	     bt6(F,X, ratio);
	     break;
	   case 33:
	     bt7(F,X, ratio);
	     break;
	   case 34:
	     bt8(F,X, ratio);
	     break;
	   case 35:
	     bt9(F,X, ratio);
	     break;

	}
	
	for(int k = 0; k < nobj ; k++) f[i*nobj + k] = F[k];

      }
}
