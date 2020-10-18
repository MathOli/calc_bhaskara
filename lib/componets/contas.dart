import 'dart:math';

class Contas{

  double delta(double a, double b, double c){
    double _delta;

    _delta = pow(b,2)-(4*a*c);

    return _delta;
  }

  double bhaskara1(double a, double b, double d){
    double _x1;
    double _delta = d;
    double _vA = a;
    double _vB = b;
    _x1 = ((-_vB + (sqrt(_delta)))/(2*_vA));

    return _x1;
  }

  double bhaskara2(double a, double b, double d){
    double _x2;
    double _delta = d;
    double _vA = a;
    double _vB = b;
    _x2 = ((-_vB - (sqrt(_delta)))/(2*_vA));

    return _x2;
  }
}

