import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  ResultText({
    this.textResult = "Click the button generate phrase",
    Key? key,
  }) : super(key: key);

  String textResult;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          // 'CLICK THE BUTTON GENERAGE PHRASE',
          textResult.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      )),
    );
  }
}
