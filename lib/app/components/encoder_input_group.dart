import 'package:caesarcipher/app/constants/box_decorations.dart';
import 'package:caesarcipher/app/modules/encode/controller/encode_controller.dart';
import 'package:caesarcipher/app/modules/encode/model/caesarcipher.dart';
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

    TextEditingController numWordsController = TextEditingController();
    TextEditingController wordsController = TextEditingController();

    wordsController.text = getCaeserCipherWords.join(" ");
    numWordsController.text = getCaeserCipherShift.toString();

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
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Number of Words";
                        } else if (int.parse(val.trim()) < 1) {
                          return "Minimum of 1";
                        } else if (int.parse(val.trim()) > 5) {
                          return "Numbers too long, max of 5";
                        } else {}
                      },
                      autovalidate: true,
                      textAlign: TextAlign.center,
                      controller: numWordsController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "Enter Number of words to generate",
                        hintStyle: TextStyle(fontSize: 8),
                        suffixIcon: Icon(Icons.account_balance_wallet),
                        alignLabelWithHint: true,
                        labelText: "Words",
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
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
                      // print(numWordsController.text);

                      CaesarCipher response = await Encodecontroller()
                          .generateWords(int.parse(numWordsController.text));
                      get<GetItCipherNotifier>().generateWords(response);
                    }

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );
                    // Fluttertoast.showToast(
                    //     msg: "This is Center Short Toast",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0);
                  }
                },
                child: Text(
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
