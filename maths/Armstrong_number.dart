import 'dart:math';
bool Armstrong_no(var x)
{
  var n=x;
  var s =n.toString();
  var d=s.length;
  var sum=0;
  while(n!=0)
  {
    var r=n%10;
    sum = sum + pow(r,d);
    n=n~/10;
  }
  return sum == x;
}
void main(){
  
  var x  = 10;
  Armstrong_no(x);
  
}
