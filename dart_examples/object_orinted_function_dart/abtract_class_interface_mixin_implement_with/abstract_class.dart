void main() {
  var obj = B();
  obj.display();
}

abstract class A {
  int x = 10;
  void display();

  void disp() {
    print(x);
  }
}

class B extends A {
  void display() {
    print('Abstract class');
    print(x);
  }
}
