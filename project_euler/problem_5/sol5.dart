void main(){
  int number = 21;
  LOOP: while(true){
    bool isSolution = true;
    for(int i = 1; i<=21;i++){
      if( number % i !=0 ){
        isSolution = false;
        break;
      } 
    }
    if(isSolution) break LOOP;
    number++;
  }
  print("Solution problem 5 = $number");
}