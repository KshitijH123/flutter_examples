void main() {
  // var obj = A();
  A.display();
}

class A {
  int x = 10;
  static int y = 20;

  static void display() {
    print(y); 
  }
}
