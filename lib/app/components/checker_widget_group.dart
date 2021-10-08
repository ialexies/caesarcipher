import 'package:caesarcipher/app/components/result_text.dart';
import 'package:caesarcipher/app/constants/box_decorations.dart';

// import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';
import 'package:caesarcipher/app/modules/encode_decode/controller/encode_controller.dart';
import 'package:caesarcipher/app/modules/encode_decode/model/caesarcipher.dart';
import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get_it_mixin/get_it_mixin.dart';

class CheckerWidgetGroup extends StatelessWidget with GetItMixin {
  static final _userAnswerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double inputGroupCheckerHeight = 250;
    int shift = 3;
    final getEncodedResult =
        watchOnly((GetItCipherNotifier x) => x.currendEncoded);
    final getCaeserCipherShift = watchOnly((GetItCipherNotifier x) => x.shift);
    final getGeneratedPhrase =
        watchOnly((GetItCipherNotifier x) => x.generatedPhrase);
    final getCheckerUswerAnswer =
        watchOnly((GetItCipherNotifier x) => x.checkerUserAnswer);

    final encodedPhraseController = TextEditingController();
    TextEditingController userAnswerController = TextEditingController();
    // userAnswerController.text = getCheckerUswerAnswer;
    encodedPhraseController.text = getEncodedResult.join(" ");

    String userAnswer = "";

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: inputGroupCheckerHeight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('No. of Shifts ${getCaeserCipherShift.toString()}'),
                      // Text('No. of Shifts $shift'),
                      TextField(
                        minLines: 1,
                        maxLines: 8,
                        controller: encodedPhraseController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term'),
                      ),

                      ElevatedButton(
                          onPressed: () async {
                            get<GetItCipherNotifier>().updateNumWords(2);

                            CaesarCipher response =
                                await Encodecontroller().generateWords(1);

                            get<GetItCipherNotifier>().generateWords(response);
                            // encodedPhraseController.text = await "fdfdf";
                            // encodedPhraseController.text =
                            //     getEncodedResult.join(" ");
                          },
                          child: Text("Generate Code"))
                    ],
                  ),
                ),
                decoration: decodeCheckerContainerDecoration(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                height: inputGroupCheckerHeight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _userAnswerFormKey,
                    child: Column(
                      children: [
                        Text('Your Answer Here'),
                        // Text('No. of Shifts $shift'),
                        TextFormField(
                          onChanged: (text) {
                            get<GetItCipherNotifier>()
                                .updateCheckerUserAnswer(text);
                            // print(text);
                            // userAnswer = text;
                          },
                          // controller: userAnswerController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term'),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              // print(userAnswer);
                              // get<GetItCipherNotifier>().updateNumWords(2);
                              // CaesarCipher response =
                              //     await Encodecontroller().generateWords(1);
                              // get<GetItCipherNotifier>().generateWords(response);
                              // print(getCheckerUswerAnswer.toString());
                              if (getCheckerUswerAnswer
                                      .toString()
                                      .toLowerCase() ==
                                  getGeneratedPhrase.join(" ")) {
                                print('valid');
                              } else {
                                print('invalid');
                              }
                            },
                            child: Text("Validate")),
                        Text(getGeneratedPhrase.join(" "))
                      ],
                    ),
                  ),
                ),
                decoration: decodeCheckerContainerDecoration(),
              ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.only(top: 180),
      // width: 250,
    );
  }

  BoxDecoration decodeCheckerContainerDecoration() {
    return BoxDecoration(
      // color: const Color.fromRGBO(15, 211, 223, 1),
      color: Colors.blueGrey,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: Colors.white.withOpacity(.5),
        width: 3,
      ),
    );
  }
}
