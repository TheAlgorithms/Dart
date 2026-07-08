//Leetcode problem no. 15: https://leetcode.com/problems/3sum/description/
//Time Complexity: O(N^2)
//Space Complexity: O(1)

//Input: A list of integers
//Output: A list of lists containing all those integers whose sum end up to 0

import 'package:test/test.dart';

import '../sort/heap_Sort.dart';

List<List<int>> threeSum(List<int> l){
  List<List<int>> ans=[];
  sort(l);
  for(int i=0; i<l.length; ++i){
    if(i!=0 && l[i]==l[i-1]) continue;
    int j=i+1, k=l.length-1;
    while(j<k){
      int sum=l[i]+l[j]+l[k];
      if(sum<0) j++;
      else if(sum>0) k--;
      else{
        ans.add([l[i], l[j], l[k]]);
        j++;
        k--;
        while(j<k && l[j]==l[j-1]) j++;
        while(j<k && l[k]==l[k+1]) k--;
      }
    }
  }
  return ans;
}

void main(){
  test('test 1', () {
    expect(threeSum([-1,0,1,2,-1,-4]), [[-1,-1,2],[-1,0,1]]);
  });

  test('test 2', () {
    expect(threeSum([0, 1, 1]), []);
  });

  test('test 3', () {
    expect(threeSum([0, 0, 0]), [[0,0,0]]);
  });
}