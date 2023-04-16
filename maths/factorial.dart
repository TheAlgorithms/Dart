void main() {
  int n = 5;
  if(n>=0){
    var fac = factorial(n);
  print("$n! = $fac"); /* output: 5! = 120 */
  }else{
    print("Invalid input. Input has to be a positive whole integer");
  }
}

/* calculate factorial of n*/
int factorial(var n) {
  var fac = 1;
  for (int i = 2; i <= n; ++i) {
    fac *= i;
  }
  return fac;
}
