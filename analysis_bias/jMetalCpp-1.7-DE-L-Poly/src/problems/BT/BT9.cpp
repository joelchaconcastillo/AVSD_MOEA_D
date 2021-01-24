//  BT9.cpp
//
//  Author:
//       Antonio J. Nebro <antonio@lcc.uma.es>
//
//  Copyright (c) 2011 Antonio J. Nebro, Juan J. Durillo
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <BT9.h>

const double BT9::PI = 3.141592653589793;

BT9::BT9(string solutionType, int numberOfVariables, int numberOfObjectives, double ratiobias) {
	numberOfVariables_   = numberOfVariables;
	numberOfObjectives_  = numberOfObjectives;
	numberOfConstraints_ = 0;
	ratiobias_ = ratiobias;
	problemName_ 				 = "BT9";

	lowerLimit_ = new double[numberOfVariables_];//(double *)malloc(sizeof(double)*numberOfVariables);
	if (lowerLimit_ == NULL) {
		cout << "Impossible to reserve memory for storing the variable lower limits" << endl;
		exit(-1);
	}

	upperLimit_ = new double[numberOfVariables_];//(double *)malloc(sizeof(double)*numberOfVariables);
	if (upperLimit_ == NULL) {
		cout << "Impossible to reserve memory for storing the variable lower limits" << endl;
		exit(-1);
	}

	for (int i = 0; i < numberOfVariables_; i++) {
		lowerLimit_[i] = 0.0;
		upperLimit_[i] = 1.0;
	}
	if (solutionType.compare("BinaryReal") == 0)
		solutionType_ = new BinaryRealSolutionType(this) ;
	else if (solutionType.compare("Real") == 0) {
		solutionType_ = new RealSolutionType(this) ;
		//cout << "Tipo seleccionado Real" << endl;
	}
	else if (solutionType.compare("ArrayReal") == 0)
		solutionType_ = new ArrayRealSolutionType(this) ;
	else {
		cout << "Error: solution type " << solutionType << " invalid" << endl;
		exit(-1) ;
	}

	fx_ = new double[numberOfObjectives_] ;
  x_ = new double[numberOfVariables_];
}

BT9::~BT9() {
  delete [] lowerLimit_ ;
  delete [] upperLimit_ ;
  delete solutionType_ ;
	delete [] fx_ ;
	delete [] x_ ;
}
long double BT9::D1(long double g, long double theta)
{
   return (g*g) + (1.0-exp(-(g*g)/theta))/5.0;
}

/**
 * Evaluates a solution
 * @param solution The solution to evaluate
 */
void BT9::evaluate(Solution *solution) {
	XReal * vars = new XReal(solution);
   long double sum1 = 0.0, sum2 = 0.0, sum3=0.0, theta = 1.0e-9*ratiobias_;
   for(int j = 3; j <= numberOfVariables_; j++)
   {
      long double yj = vars->getValue(j-1) - sin((j*M_PI)/(2.0*numberOfVariables_));
      if((j%3)==0) sum1 += D1(yj, theta);
      if((j%3)==1) sum2 += D1(yj, theta);
      if((j%3)==2) sum3 += D1(yj, theta);
   }
   solution->setObjective(0, cos(0.5*vars->getValue(0)*M_PI)*cos(0.5*vars->getValue(1)*M_PI) + 10.0*sum1);
   solution->setObjective(1, cos(0.5*vars->getValue(0)*M_PI)*sin(0.5*vars->getValue(1)*M_PI) + 10.0*sum2 );
   solution->setObjective(2, sin(0.5*vars->getValue(0)*M_PI) + 10.0*sum3);
   delete vars ;
} // evaluate
