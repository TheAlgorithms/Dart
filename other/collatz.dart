//collatz conjecture:
//A series for a number n in which if n
//even then the next number is n/2,
//but if n is odd then the next number is 3n + 1.
//This series continues till it reaches 1

//Author:Shawn
//Email:stepfencurryxiao@gmail.com
//Reference the C repo

void main() {
  //The number
  double n = 20;
  //curr_no stores number n
  double currNo = n;
  //Loop till series reaches 1
  while (currNo != 1) {
    //condition for even number
    if (currNo % 2 == 0) {
      currNo = currNo / 2;
      print('$currNo->');
    }
    //condition for odd number
    else {
      currNo = (currNo * 3) + 1;
      print('$currNo->');
    }
  }
  print('1');
}
