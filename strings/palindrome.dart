void main(){
print('Enter Words or number');
    // User enter a string or a number
    String? original =  'hannah';
  
   // then we will reverse the input
   String? reverse = original.split('').reversed.join('');
  // then we will compare
  if(original == reverse)
  {
    print('Its A Palindrome');
  }else{
    print('Its A Not Palindrome');
  }
 
}
