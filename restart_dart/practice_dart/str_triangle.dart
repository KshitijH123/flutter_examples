void main() {

  int rows = 5;
  int maxStars = 9;

  for (int i = 0; i < rows; i++) {
    int spaces = i;
    int stars = maxStars - (i * 2);

    String row = ' ' * spaces;
    row += '*' * stars;

    print(row);
  }


}
