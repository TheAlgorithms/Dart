abs_value(number){
  if(number < 0){
    return -number;
  }
  //if number is not < 0
  return number;
}

void main(){
  print(abs_value(-34));
}
