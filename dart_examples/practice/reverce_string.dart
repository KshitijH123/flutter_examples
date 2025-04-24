void main() {
  String input = "hello";
  print("Reversed: ${reverse(input)}");
}

String reverse(String str) {
  if (str.isEmpty) return "";
  return reverse(str.substring(1)) + str[0];
}

