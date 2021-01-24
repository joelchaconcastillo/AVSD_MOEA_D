//  BT5.cpp
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

#include <BT5.h>

const double BT5::PI = 3.141592653589793;

BT5::BT5(string solutionType, int numberOfVariables, int numberOfObjectives, double ratiobias) {
	numberOfVariables_   = numberOfVariables;
	numberOfObjectives_  = numberOfObjectives;
	numberOfConstraints_ = 0;
	ratiobias_ = ratiobias;
	problemName_ 				 = "BT5";

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

BT5::~BT5() {
  delete [] lowerLimit_ ;
  delete [] upperLimit_ ;
  delete solutionType_ ;
	delete [] fx_ ;
	delete [] x_ ;
}
long double BT5::D1(long double g, long double theta)
{
   return (g*g) + (1.0-exp(-(g*g)/theta))/5.0;
}

/**
 * Evaluates a solution
 * @param solution The solution to evaluate
 */
void BT5::evaluate(Solution *solution) {
	XReal * vars = new XReal(solution);
   long double sum1 = 0.0, sum2 = 0.0, theta = 1.0e-10*ratiobias_;
   for(int j = 2; j <= numberOfVariables_; j++)
   {
      long double yj = vars->getValue(j-1) - sin((j*M_PI)/(2.0*numberOfVariables_));
      if(!(j%2)) sum1 += D1(yj, theta);
      if(j%2) sum2 += D1(yj, theta);
  }
   solution->setObjective(0,  vars->getValue(0) + sum1);
   solution->setObjective(1, (1.0 - vars->getValue(0))*(1.0-vars->getValue(0)*sin(8.5*M_PI*vars->getValue(0))) + sum2);
   delete vars ;
} // evaluate
