void main() {
  List<String> names = ['Amit', 'Sneha', 'Ravi', 'Pooja', 'Karan'];
  List<double> percentages = [86.7, 91.6, 95.8, 88.5, 85.0];

  int topperIndex = 0;

  for (int i = 1; i < percentages.length; i++) {
    if (percentages[i] > percentages[topperIndex]) {
      topperIndex = i;
    }
  }

  print('Topper: ${names[topperIndex]} with ${percentages[topperIndex]}%');
}

