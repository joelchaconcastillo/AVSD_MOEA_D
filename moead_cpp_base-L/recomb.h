#ifndef _RECOMBINATION_H_
#define _RECOMBINATION_H_

#include "global.h"
#include "individual.h"

/* Routine for real polynomial mutation of an T */
void realmutation(CIndividual &ind, double rate)
{
    double rnd, delta1, delta2, mut_pow, deltaq;
    double y, yl, yu, val, xy;
	double eta_m = etam;

	//int id_rnd = int(rnd_uni(&rnd_uni_init)*nvar);
	int id_rnd = rand()%nvar;

    for (int j=0; j<nvar; j++)
    {
        //if (rnd_uni(&rnd_uni_init)<=rate)
        if(RAND_ONE<=rate)
        {
            y  = ind.x_var[j];
            yl = vlowBound[j];
            yu = vuppBound[j];
            delta1 = (y-yl)/(yu-yl);
            delta2 = (yu-y)/(yu-yl);
            //rnd = rnd_uni(&rnd_uni_init);
            rnd = RAND_ONE;
            mut_pow = 1.0/(eta_m+1.0);
            if (rnd <= 0.5)
            {
                xy = 1.0-delta1;
                val = 2.0*rnd+(1.0-2.0*rnd)*(pow(xy,(eta_m+1.0)));
                deltaq =  pow(val,mut_pow) - 1.0;
            }
            else
            {
                xy = 1.0-delta2;
                val = 2.0*(1.0-rnd)+2.0*(rnd-0.5)*(pow(xy,(eta_m+1.0)));
                deltaq = 1.0 - (pow(val,mut_pow));
            }
            y = y + deltaq*(yu-yl);
            if (y<yl)
                y = yl;
            if (y>yu)
                y = yu;
            ind.x_var[j] = y;
        }
    }
    return;
}


/* Routine for real variable SBX crossover */
template <class T>
void real_sbx_xoverA(CIndividual &parent1, CIndividual &parent2, CIndividual &child1, CIndividual &child2)
{
    double randv;
    double y1, y2, yl, yu;
    double c1, c2;
    double alpha, beta, betaq;
	double eta_c = etax;
    //if (rnd_uni(&rnd_uni_init) <= 1.0) 
    if (RAND_ONE  <= 1.0) 
    {
        for (int i=0; i<nvar; i++)
        {
            //if (rnd_uni(&rnd_uni_init)<=0.5 )
            if(RAND_ONE <=0.5 )
            {
                if (fabs(parent1.x_var[i]-parent2.x_var[i]) > EPS)
                {
                    if (parent1.x_var[i] < parent2.x_var[i])
                    {
                        y1 = parent1.x_var[i];
                        y2 = parent2.x_var[i];
                    }
                    else
                    {
                        y1 = parent2.x_var[i];
                        y2 = parent1.x_var[i];
                    }
                    yl = lowBound;
                    yu = uppBound;
                  //  rand = rnd_uni(&rnd_uni_init);
                    randv = RAND_ONE;
                    beta = 1.0 + (2.0*(y1-yl)/(y2-y1));
                    alpha = 2.0 - pow(beta,-(eta_c+1.0));
                    if (randv <= (1.0/alpha))
                    {
                        betaq = pow ((randv*alpha),(1.0/(eta_c+1.0)));
                    }
                    else
                    {
                        betaq = pow ((1.0/(2.0 - randv*alpha)),(1.0/(eta_c+1.0)));
                    }
                    c1 = 0.5*((y1+y2)-betaq*(y2-y1));
                    beta = 1.0 + (2.0*(yu-y2)/(y2-y1));
                    alpha = 2.0 - pow(beta,-(eta_c+1.0));
                    if (randv <= (1.0/alpha))
                    {
                        betaq = pow ((randv*alpha),(1.0/(eta_c+1.0)));
                    }
                    else
                    {
                        betaq = pow ((1.0/(2.0 - randv*alpha)),(1.0/(eta_c+1.0)));
                    }
                    c2 = 0.5*((y1+y2)+betaq*(y2-y1));
                    if (c1<yl)
                        c1=yl;
                    if (c2<yl)
                        c2=yl;
                    if (c1>yu)
                        c1=yu;
                    if (c2>yu)
                        c2=yu;
                    //if (rnd_uni(&rnd_uni_init)<=0.5)
                    if(RAND_ONE <=0.5)
                    {
                        child1.x_var[i] = c2;
                        child2.x_var[i] = c1;
                    }
                    else
                    {
                        child1.x_var[i] = c1;
                        child2.x_var[i] = c2;
                    }
                }
                else
                {
                    child1.x_var[i] = parent1.x_var[i];
                    child2.x_var[i] = parent2.x_var[i];
                }
            }
            else
            {
                child1.x_var[i] = parent1.x_var[i];
                child2.x_var[i] = parent2.x_var[i];
            }
        }
    }
    else
    {
        for (int i=0; i<nvar; i++)
        {
            child1.x_var[i] = parent1.x_var[i];
            child2.x_var[i] = parent2.x_var[i];
        }
    }
    return;
}

void real_sbx_xoverB (CIndividual &parent1, CIndividual &parent2, CIndividual &child)
{
    double randv;
    double y1, y2, yl, yu;
    double c1, c2;
    double alpha, beta, betaq;
	double eta_c = etax;
    //if (rnd_uni(&rnd_uni_init) <= 1.0) 
    if (RAND_ONE  <= 1.0) 
    {
        for (int i=0; i<nvar; i++)
        {
            //if (rnd_uni(&rnd_uni_init)<=0.5 )
            if (RAND_ONE <=0.5 )
            {
                if (fabs(parent1.x_var[i]-parent2.x_var[i]) > EPS)
                {
                    if (parent1.x_var[i] < parent2.x_var[i])
                    {
                        y1 = parent1.x_var[i];
                        y2 = parent2.x_var[i];
                    }
                    else
                    {
                        y1 = parent2.x_var[i];
                        y2 = parent1.x_var[i];
                    }
                    yl = lowBound;
                    yu = uppBound;
                    //rand = rnd_uni(&rnd_uni_init);
                    randv = RAND_ONE;
                    beta = 1.0 + (2.0*(y1-yl)/(y2-y1));
                    alpha = 2.0 - pow(beta,-(eta_c+1.0));
                    if (randv <= (1.0/alpha))
                    {
                        betaq = pow ((randv*alpha),(1.0/(eta_c+1.0)));
                    }
                    else
                    {
                        betaq = pow ((1.0/(2.0 - randv*alpha)),(1.0/(eta_c+1.0)));
                    }
                    c1 = 0.5*((y1+y2)-betaq*(y2-y1));
                    beta = 1.0 + (2.0*(yu-y2)/(y2-y1));
                    alpha = 2.0 - pow(beta,-(eta_c+1.0));
                    if (randv <= (1.0/alpha))
                    {
                        betaq = pow ((randv*alpha),(1.0/(eta_c+1.0)));
                    }
                    else
                    {
                        betaq = pow ((1.0/(2.0 - randv*alpha)),(1.0/(eta_c+1.0)));
                    }
                    c2 = 0.5*((y1+y2)+betaq*(y2-y1));
                    if (c1<yl)
                        c1=yl;
                    if (c2<yl)
                        c2=yl;
                    if (c1>yu)
                        c1=yu;
                    if (c2>yu)
                        c2=yu;
                    //if (rnd_uni(&rnd_uni_init)<=0.5)
                    if(RAND_ONE <=0.5)
                    {
                        child.x_var[i] = c2;
                    }
                    else
                    {
                        child.x_var[i] = c1;
                    }
                }
                else
                {
                    child.x_var[i] = parent1.x_var[i];
                }
            }
            else
            {
                child.x_var[i] = parent1.x_var[i];
            }
        }
    }
    else
    {
        for (int i=0; i<nvar; i++)
        {
            child.x_var[i] = parent1.x_var[i];
        }
    }
    return;
}


void diff_evo_xoverA(CIndividual &ind0, CIndividual &ind1, CIndividual &ind2, CIndividual &ind3, CIndividual &child, double CR, double rate)
{

	// Check Whether the cross-over to be performed
	/*Loop over no of variables*/
	int idx_rnd = rand()% nvar;

//	double CR   =  0.0;// (rnd_uni(&rnd_uni_init)<0.5)?0.2:1.0;
	for(int n=0;n<nvar;n++)
	{
	  //double rnd = rnd_uni(&rnd_uni_init);
	  double rnd = RAND_ONE;
	  if(rnd<CR||n==idx_rnd)
		  child.x_var[n] = ind1.x_var[n] + rate*(ind2.x_var[n] - ind3.x_var[n]);
	  else
		  child.x_var[n] = ind0.x_var[n];
	
	  if(child.x_var[n]<vlowBound[n]){
		  //double rnd = rnd_uni(&rnd_uni_init);
		 // double rnd = RAND_ONE;
		 // child.x_var[n] = vlowBound[n] + rnd*(ind0.x_var[n] - vlowBound[n]);
		  child.x_var[n] = ind0.x_var[n];
	  }
	  if(child.x_var[n]>vuppBound[n]){ 
		  //double rnd = rnd_uni(&rnd_uni_init);
		//  double rnd = RAND_ONE;
		//  child.x_var[n] = vuppBound[n] - rnd*(vuppBound[n] - ind0.x_var[n]);
		  child.x_var[n] = ind0.x_var[n];
	  }
	  if(child.x_var[n]<vlowBound[n]) child.x_var[n] = vlowBound[n];
	  if(child.x_var[n]>vuppBound[n]) child.x_var[n] = vuppBound[n];
	}
}


void diff_evo_xoverB(CIndividual &ind0, CIndividual &ind1, CIndividual &ind2, CIndividual &child, double rate)
{

	//int idx_rnd = int(rnd_uni(&rnd_uni_init)*nvar);
	int idx_rnd = rand()%nvar;
	//double CR   =  (rnd_uni(&rnd_uni_init)<0.5)?0.2:1.0;
	double CR   =  (RAND_ONE <0.5)?0.2:1.0;
	for(int n=0;n<nvar;n++)
	{
	  /*Selected Two Parents*/

	  // strategy one 
	  // child.x_var[n] = ind0.x_var[n] + rate*(ind2.x_var[n] - ind1.x_var[n]);
	  
	  //*
	  // strategy two
	  //double rnd1 = rnd_uni(&rnd_uni_init);
	  double rnd1 = RAND_ONE;
//	  double CR   = 1.0;
	  if(rnd1<CR||n==idx_rnd)
		  child.x_var[n] = ind0.x_var[n] + rate*(ind2.x_var[n] - ind1.x_var[n]);
	  else
		  child.x_var[n] = ind0.x_var[n];
	  //*/


	  // handle the boundary voilation
	  if(child.x_var[n]<vlowBound[n]){
		  //double rnd = rnd_uni(&rnd_uni_init);
		  double rnd = RAND_ONE;
		  child.x_var[n] = vlowBound[n] + rnd*(ind0.x_var[n] - vlowBound[n]);
		  //child.x_var[n] = ind0.x_var[n];
	  }
	  if(child.x_var[n]>vuppBound[n]){ 
		  //double rnd = rnd_uni(&rnd_uni_init);
		  double rnd = RAND_ONE;
		  child.x_var[n] = vuppBound[n] - rnd*(vuppBound[n] - ind0.x_var[n]);
		  //child.x_var[n] = ind0.x_var[n];
	  }

	  if(child.x_var[n]<vlowBound[n]) child.x_var[n] = vlowBound[n];
	  if(child.x_var[n]>vuppBound[n]) child.x_var[n] = vuppBound[n];
	}
}

void diff_evo_xoverC(CIndividual &ind0, CIndividual &ind1, CIndividual &ind2, vector<double> &xdiff,  CIndividual &child,  double rate)
{
      //double rnd = rnd_uni(&rnd_uni_init), rnd2 = rnd_uni(&rnd_uni_init);
      double rnd = RAND_ONE, rnd2 = RAND_ONE;
	  for(int n=0;n<nvar;n++)
	  {
		  /*Selected Two Parents*/
		  
		  if(rnd<1)
		      child.x_var[n] = ind0.x_var[n] + rate*(ind2.x_var[n] - ind1.x_var[n]);
		  else
			  child.x_var[n] = ind0.x_var[n] + rnd2*xdiff[n];
	
		  if(child.x_var[n]<vlowBound[n]) child.x_var[n] = vlowBound[n];
		  if(child.x_var[n]>vuppBound[n]) child.x_var[n] = vuppBound[n];
	  }
}

#endif
