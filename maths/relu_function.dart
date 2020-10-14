// Program to Implement RELU function
// RELU function is commonly used in Machine learning as an activation function

int relu_func(var x) {
  // here x passed is value passed in the function relu
  if (x > 0)
    return x;
  else
    return 0;
}

//Driver function for RELU function
int main() {
  var a = 5;
  print(relu_func(a));
  var b = -1;
  print(relu_func(b));
  return 0;
}
