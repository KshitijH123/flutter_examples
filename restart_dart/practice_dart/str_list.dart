void main() {
  List<int> stars = [5, 3, 1];

  for (int i = 0; i < stars.length; i++) {
    int spaces = i;
    String line = ' ' * spaces + '*' * stars[i];
    print(line);
  }
}
