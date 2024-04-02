/// Author: Pasan Godamune
/// Email: pasanjg@gmail.com

/**
 * [Problem 17](https://projecteuler.net/problem=17) solution
 * Problem Statement:
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 * 
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
 * The use of "and" when writing out numbers is in compliance with British usage.
 */

import 'dart:math';

const ONES = [
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten'
];

const TEN_TWENTY = [
  'Eleven',
  'Twelve',
  'Thirteen',
  'Fourteen',
  'Fifteen',
  'Sixteen',
  'Seventeen',
  'Eighteen',
  'Nineteen'
];

const TENS = [
  'Ten',
  'Twenty',
  'Thirty',
  'Forty', // [It's 'Forty' NOT 'Fourty'](https://www.grammarly.com/blog/forty-fourty/)
  'Fifty',
  'Sixty',
  'Seventy',
  'Eighty',
  'Ninety'
];

const HUNDRED = 'Hundred';
const THOUSDAND = 'Thousand';
const AND = 'And';

String inWords = "";

String convertToWords(int number) {
  String numString = number.toString();
  int length = numString.length;
  int place = pow(10, length - 1).toInt();

  if (number == 0) return inWords = "Zero";

  if (length == 1) {
    inWords = ONES[number - 1];
  }

  if (length == 2) {
    inWords = TENS[(number / place).floor() - 1];

    if (number % place != 0) {
      if (number < 20) {
        return inWords = TEN_TWENTY[(number % place) - 1];
      }

      inWords += convertToWords(number % place);
    }
  }

  if (length == 3) {
    inWords = convertToWords((number / place).floor()) + HUNDRED;

    if (number % place != 0) {
      inWords += AND + convertToWords(number % place);
    }
  }

  if (length == 4) {
    inWords = convertToWords((number / place).floor()) + THOUSDAND;

    if (number % place != 0) {
      inWords += AND + convertToWords(number % place);
    }
  }

  return inWords;
}

calculateWithRange({int start = 1, end = 1000}) {
  int count = 0;

  if (end > 1000) {
    print("Max safe range is 0 - 1000 inclusive");
    return;
  }

  for (int i = start; i <= end; i++) {
    count += convertToWords(i).length;
  }

  print(count);
}

void main() {
  calculateWithRange(start: 1, end: 1000); // 21124
}
