
void main(){
  int max = 0;
  for(int i = 100; i<1000;i++){
    for(int j = 100; j<1000;j++){
      int result = i * j;
      if(isPanlindrome("$result")){
        if(result>max){
          max = result;
        }
      }
    }
  }
  print("MAX $max");
}
bool isPanlindrome(String word) {
  for (int i = 0; i < word.length ~/ 2; i++) {
    if (word[i] != word[word.length - i - 1]) return false;
  }
  return true;
}