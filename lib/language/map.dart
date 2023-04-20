void main() {
  // final number = 123;
  //
  // print(number.toString().runtimeType);
  // print(number.toString().split('').runtimeType);
  // print(number.toString().split('').map((e) => '$e.jpg').toList());

  final numbers = [
    123,
    456,
    789,
  ];

  // print(
  //   numbers.map(
  //     (x) => x.toString().split('').map(
  //           (y) => '$y.jpg',
  //         ).toList(),
  //   ).toList(),
  // );

  // (MapEntry(0: 123), MapEntry(1: 456), MapEntry(2: 789))
  print(numbers.asMap());
  // print(numbers.asMap().entries);
  // print(numbers.asMap().entries.runtimeType);
  // print(numbers.asMap().entries.map((e) => print('${e.key}, ${e.value}')));
  // print(numbers.asMap().entries.toList());
  // print(numbers.asMap().entries.toList()[0].key);
  // print(numbers.asMap().entries.toList()[0].value);
}
