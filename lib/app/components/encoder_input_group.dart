import 'package:caesarcipher/app/constants/box_decorations.dart';

// import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';
import 'package:caesarcipher/app/modules/encode_decode/controller/encode_controller.dart';
import 'package:caesarcipher/app/modules/encode_decode/model/caesarcipher.dart';
import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get_it_mixin/get_it_mixin.dart';

class EncoderInputGroup extends StatelessWidget with GetItMixin {
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final getCaeserCipherWords =
        watchOnly((GetItCipherNotifier x) => x.wordings);
    final getCaeserCipherShift = watchOnly((GetItCipherNotifier x) => x.shift);
    final getNumWords = watchOnly((GetItCipherNotifier x) => x.numWords);

    TextEditingController numWordsController = TextEditingController();
    TextEditingController wordsController = TextEditingController();
    TextEditingController shiftController = TextEditingController();

    wordsController.text = getCaeserCipherWords.join(" ");
    shiftController.text = getCaeserCipherShift.toString();
    numWordsController.text = getNumWords.toString();

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (text) {
                        if (text != "") {
                          get<GetItCipherNotifier>().updateNumWords(
                              // int.parse((getNumWords.toString() + text)));
                              int.parse(text));
                        }
                      },
                      autofocus: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Number of Words";
                        } else if (int.parse(val.trim()) < 1) {
                          return "Minimum of 1";
                        } else if (int.parse(val.trim()) > 5) {
                          return "Numbers too long, max of 5";
                        } else {}
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // controller: numWordsController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "Enter Number of words to generate",
                        hintStyle: TextStyle(fontSize: 8),
                        labelText: "Words Count",
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: shiftController,
                      decoration: InputDecoration(
                        hintText: "Enter Number of words to generate",
                        hintStyle: TextStyle(fontSize: 8),
                        labelText: "Shift",
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: wordsController,
                      minLines: 3,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      decoration:
                          BoxDecorations().decoration_encoder_input_words(),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.blue,
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_formKey.currentState!.validate()) {
                      try {
                        get<GetItCipherNotifier>()
                            .updateNumWords(int.parse(numWordsController.text));
                        get<GetItCipherNotifier>().updateIsLoading(true);
                        CaesarCipher response = await Encodecontroller()
                            .generateWords(int.parse(numWordsController.text));
                        get<GetItCipherNotifier>().generateWords(response);

                        FocusScope.of(context).unfocus();
                        numWordsController.clear();
                        get<GetItCipherNotifier>().updateIsLoading(false);
                      } catch (e) {}
                    }
                  }
                },
                child: const Text(
                  "Generate Phrase",
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              // Text(getCaeserCipherWords.toString()),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 180),
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(15, 211, 223, 1),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white.withOpacity(.5),
          width: 3,
        ),
      ),
    );
  }
}
