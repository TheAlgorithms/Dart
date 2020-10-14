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
  double curr_no = n;
  //Loop till series reaches 1
  while (curr_no != 1) {
    //condition for even number
    if (curr_no % 2 == 0) {
      curr_no = curr_no / 2;
      print(curr_no.toString() + "->");
    }
    //condition for odd number
    else {
      curr_no = (curr_no * 3) + 1;
      print(curr_no.toString() + "->");
    }
  }
  print("1");
}
