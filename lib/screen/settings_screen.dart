import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // 불가능
  // state에서 선언한 변수에서는 wiget. 사용 불가능합니다.
  // 여기에 선언한 변수들은 state가 생성이 되기 전에 즉 StatefulWidget붙기 전에
  // 다 값이 설정이 되기 때문입니다.
  // double maxNumber = widget.maxNumber;
  double maxNumber = 1000;

  // 기본 StatefulWidget 생명주기 참고하세요.
  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(
                maxNumber: maxNumber,
              ),
              _Footer(
                maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
                onButtonPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    print(val);
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    // 뒤로가기
    Navigator.of(context).pop<int>(maxNumber.toInt());
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const _Footer({
    Key? key,
    this.onSliderChanged,
    required this.maxNumber,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
          onPressed: onButtonPressed,
          child: Text('저장'),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}
