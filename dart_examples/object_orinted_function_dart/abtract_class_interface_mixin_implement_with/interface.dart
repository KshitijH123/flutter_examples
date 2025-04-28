void main() {
  var tv = Television();
  tv.volumeUp();
  tv.volumeDown();
  tv.justAnotherMethod();
}

class Remote {
  void volumeUp() {
    print('Volume up from remote');
  }

  void volumeDown() {
    print('Volume down from remote');
  }
}

class AnotherClass {
  void justAnotherMethod() {}
}

class Television implements Remote, AnotherClass {
  void volumeUp() {
    print('Volume up from Television');
  }

  void volumeDown() {
    print('Volume down from Television');
  }

  void justAnotherMethod() {
    print('Some code');
  }
}
