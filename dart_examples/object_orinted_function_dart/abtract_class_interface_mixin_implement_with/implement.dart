// implements keyword
// Used when you want to implement an interface (whether normal class or abstract class).

// You must override everything.

class A{
  void method1(){}
  void method2(){}
}

class C{
  void method3(){}
}

class B implements A,C{
 void method1(){}
 void method2(){}
 void method3(){}
}