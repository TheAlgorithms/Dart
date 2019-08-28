int linear_search(List a,number){
  for(var i = 0;i < a.length;i++){
    if(a[i] == number){
      return i;
    }
  }
  return -1;
}


void main(){
  var list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 ,89];
  var x = 15;
  var index = linear_search(list,x);
  print('list:');
  print(list);
  if(index != -1){
    print(x.toString() + ' found at positions: ' + index.toString());
  }
  else{
    print(x.toString() + ' Not found');
  }
}