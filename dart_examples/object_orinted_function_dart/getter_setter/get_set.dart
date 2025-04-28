void main() {
  var obj = A();

  obj.customSet = 'Yash';
  print(obj.customSet);
}

class A {
  var name;

  void set customSet(var name) {
    this.name = name;
  }

  String get customSet {
    return name;
  }
}
