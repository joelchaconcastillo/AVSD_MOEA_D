This folder contains the source code of the R2-EMOA as described in the following publications:

[3] D. Brockhoff, T. Wagner, and H. Trautmann. R2 Indicator Based
    Multiobjective Search. Evolutionary Computation, MIT Press, 2013.
    Submitted.

[4] H. Trautmann, T. Wagner, and D. Brockhoff. R2-EMOA: Focused 
    Multiobjective Search Using R2-Indicator-Based Selection. Learning and
    Intelligent Optimization Conference (LION 2013), Springer, 2013. Short
    paper. Accepted for publication.


Usage:
------
displaying default options:
	OPTS = R2EMOA('displayoptions') 

running the algorithm:
	[PARETOFRONT, PARETOSET] = R2EMOA(PROBLEM[, OPTS])

for example on DTLZ1 with nVar=30 variables, polynomial mutation, and SBX crossover
instead of differential evolution as variation operators:
	myopts.nVar = 30;
	myopts.useDE = false;
	[PARETOFRONT, PARETOSET] = R2EMOA('DTLZ1', myopts)


Copyright:
----------
copyright by Tobias Wagner, Fabian Kretzschmar, and Dimo Brockhoff
2008 - 2013
license: GPL, version 2


Necessary compilations before first use:
----------------------------------------
for the hypervolume part:
	mex -I. hv.cpp Hypervolume.cpp
for the paretofront part:
	mex paretofront.c


Known issues:
-------------
2013/01/30: Together with OCD, the number of offspring (nOffspring) is not allowed to be larger
  than the population size (nPop)