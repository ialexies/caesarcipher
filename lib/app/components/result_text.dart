import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class ResultText extends StatelessWidget with GetItMixin {
  ResultText({
    // this.textResult = "Click the button generate phrase",
    this.resultTextColor = Colors.black,
    this.isCheckerPage = false,
    Key? key,
  }) : super(key: key);

  Color resultTextColor;
  bool isCheckerPage;

  // String textResult;
  @override
  Widget build(BuildContext context) {
    final getEncodedResult =
        watchOnly((GetItCipherNotifier x) => x.currendEncoded);
    final getCheckerResult =
        watchOnly((GetItCipherNotifier x) => x.checkerResult);

    dynamic textToDisplay;

    if (isCheckerPage == true) {
      textToDisplay = getCheckerResult.toString();
    } else {
      textToDisplay = getEncodedResult.join(" ");
    }

    return Expanded(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          textToDisplay,
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
