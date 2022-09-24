//Title:Find LCM of two numbers.
//Author:Shawn
//Email:stepfencurryxiao@gmail.com

/*suppose we have two numbers a and b.
 * Property: Since product of LCM and GCD of two numbers are
 * equal to product of that number itself.
 * i.e, LCM(a,b)*GCD(a,b)=a*b
 * So,here we first find GCD of two numbers and using above
 * property we find LCM of that two numbers.
 */

//Recursive function to return gcd of a and b
int gcd(int a, int b) {
  if (a == 0) {
    return b;
  }
  return gcd(b % a, a);
}

//Function to return LCM of two numbers
double lcm(int a, int b) {
  return (a * b) / gcd(a, b);
}

//Driver program
void main() {
  int a, b;
  //Test case1:
  a = 15;
  b = 20;
  //print the result
  print('LCM of $a and $b is ${lcm(a, b)}');
  //Test case2:
  a = 12;
  b = 18;
  //print the result
  print('LCM of $a and $b is ${lcm(a, b)}');
}
