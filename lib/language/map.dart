void main() {
  final number = 123;

  print(number.toString().runtimeType);
  print(number.toString().split('').runtimeType);
  print(number.toString().split('').map((e) => '$e.jpg').toList());

  final numbers = [
    123,
    456,
    789,
  ];

  print(
    numbers.map(
      (x) => x.toString().split('').map(
            (y) => '$y.jpg',
          ).toList(),
    ).toList(),
  );
}
