//  BT8.h
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

#ifndef __BT8_H__
#define __BT8_H__

#include <Problem.h>
#include <math.h>
#include <BinaryRealSolutionType.h>
#include <RealSolutionType.h>
#include <ArrayRealSolutionType.h>
#include <XReal.h>
#include <Solution.h>

class BT8 : public Problem {
public:

        BT8(string solutionType, int numberOfVariables=30, int numberOfObjectives=2, double ratiobias=1.0);
	long double D1(long double g, long double theta);
	void evaluate(Solution *solution);
	inline long double Q(long double z){ return 4.0*z*z - cos(8.0*M_PI*z)+1.0; }


	virtual ~BT8();
private:
	double * fx_ ;
  double * x_ , ratiobias_;
  static const double PI;
};

#endif /* __BT8_H__ */
