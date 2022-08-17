import 'package:exchange/src/utils/theme_util.dart';
import 'package:flutter/material.dart';

class ButtonTime extends StatelessWidget {
  const ButtonTime({Key? key, required this.time, required this.changeTime})
      : super(key: key);
  final String time;
  final void Function() changeTime;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: changeTime,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(50, 30),
          side: const BorderSide(color: neutral50),
          shape: const StadiumBorder(),
          primary: neutral80),
      child: Text(time),
    );
  }
}
