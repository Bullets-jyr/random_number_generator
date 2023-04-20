import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              // SizedBox: Container보다 기능이 적은 위젯
              // SizedBox(
              //   // 무한대
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       '생성하기!',
              //     ),
              //   ),
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //         onPressed: () {},
              //         child: Text(
              //           '생성하기!',
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              _Footer(
                onPressed: onRandomNumberGenerate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    final rand = Random();

    // final List<int> newNumbers = [];
    final Set<int> newNumbers = {};

    // for (int i = 0; i < 3; i++) {
    //   final number = rand.nextInt(1000);
    //
    //   newNumbers.add(number);
    // }

    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);

      newNumbers.add(number);
    }

    print(rand.nextInt(1000));

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizedBox대신 Container도 가능
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text(
          '생성하기!',
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({
    Key? key,
    required this.randomNumbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // child: SizedBox(
      //   width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map(
                        (y) => Image.asset(
                          'asset/img/$y.png',
                          height: 70.0,
                          width: 50.0,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
      // ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: () {
            // list - add
            // [HomeScreen(), SettingsScreen()]
            Navigator.of(context).push(
              // Route == Screen
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SettingsScreen();
                },
              ),
            );
          },
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}
