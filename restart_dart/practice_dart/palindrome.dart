void main() {
  int number = 12321; 
  if (isPalindrome(number)) {
    print('$number is a palindrome');
  } else {
    print('$number is not a palindrome');
  }
}

bool isPalindrome(int number) {
  String original = number.toString();
  String reversed = original.split('').reversed.join('');
  return original == reversed;
}
