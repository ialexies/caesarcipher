import 'package:flutter/material.dart';

class CompRoundedButton extends StatelessWidget {
  const CompRoundedButton({
    this.btnTitle = "",
    this.bgColor = Colors.blue,
    this.outlineColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final String btnTitle;
  final Color bgColor;
  final Color outlineColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        primary: bgColor,
        side: BorderSide(color: outlineColor),
      ),
      onPressed: () {},
      child: Text(
        btnTitle,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
