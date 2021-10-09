import 'package:caesarcipher/app/modules/encode_decode/controller/encode_controller.dart';
import 'package:caesarcipher/app/modules/encode_decode/model/caesarcipher.dart';
import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it_mixin/get_it_mixin.dart';

class CheckerWidgetGroup extends StatelessWidget with GetItMixin {
  static final _userAnswerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double inputGroupCheckerHeight = 300;

    final getEncodedResult =
        watchOnly((GetItCipherNotifier x) => x.currendEncoded);
    final getCaeserCipherShift = watchOnly((GetItCipherNotifier x) => x.shift);
    final getGeneratedPhrase =
        watchOnly((GetItCipherNotifier x) => x.generatedPhrase);
    final getCheckerUswerAnswer =
        watchOnly((GetItCipherNotifier x) => x.checkerUserAnswer);

    final encodedPhraseController = TextEditingController();

    // userAnswerController.text = getCheckerUswerAnswer;
    encodedPhraseController.text = getEncodedResult.join(" ");

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

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
                      // SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No. of\nShifts ${getCaeserCipherShift.toString()}'
                              .toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextField(
                        readOnly: true,
                        minLines: 6,
                        maxLines: 8,
                        controller: encodedPhraseController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          get<GetItCipherNotifier>().updateIsLoading(true);
                          get<GetItCipherNotifier>().updateNumWords(2);
                          CaesarCipher response =
                              await Encodecontroller().generateWords(1);

                          get<GetItCipherNotifier>().generateWords(response);
                          get<GetItCipherNotifier>().updateIsLoading(false);
                        },
                        child: const Text(
                          "Generate Code",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                      ),
                    ],
                  ),
                ),
                decoration: decodeCheckerContainerDecoration(),
              ),
            ),
            const SizedBox(
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
                        // SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Your\nAnswer Here'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          minLines: 6,
                          maxLines: 8,
                          // textCapitalization: TextCapitalization.,
                          onChanged: (text) {
                            get<GetItCipherNotifier>()
                                .updateCheckerUserAnswer(text);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            get<GetItCipherNotifier>().updateIsLoading(true);
                            if (getCheckerUswerAnswer
                                    .toString()
                                    .toLowerCase() ==
                                getGeneratedPhrase.join(" ")) {
                              // print('valid');
                              get<GetItCipherNotifier>()
                                  .updateCheckerResult('Valid');
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              Future.delayed(const Duration(milliseconds: 800),
                                  () {
                                get<GetItCipherNotifier>()
                                    .updateIsLoading(false);
                              });
                            } else {
                              // print('invalid');
                              get<GetItCipherNotifier>()
                                  .updateCheckerResult('Invalid');
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              Future.delayed(const Duration(milliseconds: 800),
                                  () {
                                get<GetItCipherNotifier>()
                                    .updateIsLoading(false);
                              });
                            }

                            // get<GetItCipherNotifier>().updateIsLoading(false);
                          },
                          child: const Text("Validate"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                        ),
                        Text(
                          "\"${getGeneratedPhrase.join(' ')}\"",
                          style: const TextStyle(fontSize: 8),
                        ) //Checker of the right answer
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
      // margin: EdgeInsets.only(top: 180),
      margin: isKeyboard ? EdgeInsets.only(top: 20) : EdgeInsets.only(top: 180),
      // width: 250,
    );
  }

  BoxDecoration decodeCheckerContainerDecoration() {
    return BoxDecoration(
      // color: const Color.fromRGBO(15, 211, 223, 1),
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: Colors.grey.withOpacity(.5),
        width: 1,
      ),
    );
  }
}
