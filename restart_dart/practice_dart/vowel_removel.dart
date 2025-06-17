void main() {
  String original = "captain america";
  String result = removeVowels(original);

  print(result);
}

String removeVowels(String input) {
  final RegExp vowelPattern = RegExp(r'[aeiouAEIOU]');

  return input.replaceAll(vowelPattern, '');
}
