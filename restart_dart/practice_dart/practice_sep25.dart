void main() {
  String A = '111111114568723649875216';
  String B = '456789134586127334892452';

  BigInt big1 = BigInt.parse(A);
  BigInt big2 = BigInt.parse(B);

  BigInt result = big1 * big2;
  print(result);
}
