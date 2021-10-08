import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class ResultText extends StatelessWidget with GetItMixin {
  ResultText({
    // this.textResult = "Click the button generate phrase",
    this.resultTextColor = Colors.black,
    Key? key,
  }) : super(key: key);

  Color resultTextColor;

  // String textResult;
  @override
  Widget build(BuildContext context) {
    final getEncodedResult =
        watchOnly((GetItCipherNotifier x) => x.currendEncoded);
    return Expanded(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          getEncodedResult.join(" "),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: resultTextColor),
        ),
      )),
    );
  }
}
