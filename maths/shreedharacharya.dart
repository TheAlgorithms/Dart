import 'dart:math';
//this function return a list of roots of a quadratic equation
// [x1, x2] where x1 and x2 are roots of
// aX^2 + bX + c = 0
List shreedharacharya(double a,double b,double c) 
{
  double d = b*b - 4*a*c;
  List A=[0,0];
  if(d<0)
  {
    print('Imaginary roots');
  }
  else{
   A.add((-b + sqrt(d))/(2*a));
    A[1] = (-b - pow(d,0.5))/(2*a);
    return A;
  }
  
}
void main()
{
  double a=1.00,b=0.00,c=-4.00;
    List p=shreedharacharya(a,b,c);
  print(p);
  
}
