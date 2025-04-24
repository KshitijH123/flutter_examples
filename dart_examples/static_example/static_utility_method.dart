class MathUtils {
  static int max(int a, int b) {
    return (a > b) ? a : b;
  }
}

void main() {
  print("Max of 10 and 20 is: ${MathUtils.max(10, 20)}");
}
