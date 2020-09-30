import 'dart:math';
void quadratic(var a,var b,var c)//calculates roots of quadratic equations
{
  var det = pow(b,2) - (4*a*c);
  if(det<0){
    print('imaginary roots');
   
  }
 else
 {
   var r1,r2;
     r1 = (-b + pow(det,1/2))/(2*a);
   r2 = (-b - pow(det,1/2))/(2*a);
  print(r1);
   print(r2);
}
}
void main(){
  var a=1,b=0,c=-4;
    quadratic(a,b,c);
  
}
