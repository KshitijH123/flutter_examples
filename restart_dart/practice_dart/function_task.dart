void main() {
  Kshitij kshitij = Kshitij();

  int result = kshitij.hundredthMultiple(2);
  print(result);

  String sResult = kshitij.stringPlusHello('Kshitij');
  print(sResult);
}

class Kshitij {
  int hundredthMultiple(int n) {
    return n * 100;
  }

  String stringPlusHello(String j) {
    return j + " Hello!";
  }
}
