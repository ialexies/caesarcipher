import 'package:caesarcipher/app/constants/box_decorations.dart';
import 'package:flutter/material.dart';
import 'package:caesarcipher/app/components/comp_rounded_button.dart';
import 'package:caesarcipher/app/components/textfield_encoder_input.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EncoderInputGroup extends StatefulWidget {
  EncoderInputGroup({
    Key? key,
  }) : super(key: key);

  @override
  State<EncoderInputGroup> createState() => _EncoderInputGroupState();
}

class _EncoderInputGroupState extends State<EncoderInputGroup> {
  TextEditingController numWordsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  void initState() {
    // TODO: implement initState
    numWordsController.text = "1";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  // const CompRoundedButton(
                  //   btnTitle: "Generate Phrase",
                  //   bgColor: Colors.blue,
                  //   outlineColor: Colors.white,
                  // ),

                  // const SizedBox(
                  //   width: 15,
                  // ),
                  // const Center(
                  //   child: Text(
                  //     'Words:   ',
                  //     style: TextStyle(fontSize: 14),
                  //   ),
                  // ),
                  Expanded(
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Number of Words";
                        } else if (int.parse(val.trim()) < 1) {
                          // print("Invalid Number of Words");
                          return "Minimum of 1";
                          // return null;
                        } else if (int.parse(val.trim()) > 5) {
                          // print("Numbers too long, max of 5");
                          return "Numbers too long, max of 5";
                          // return null;
                        } else {}
                      },

                      autovalidate: true,

                      textAlign: TextAlign.center,
                      controller: numWordsController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // minLines: 1,
                      maxLines: 1,
                      // decoration: BoxDecorations().decoration_encoder_input_words(),
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
                onPressed: () {
                  // print(numWordsController.text);

                  if (_formKey.currentState!.validate()) {
                    if (_formKey.currentState!.validate()) {
                      print(numWordsController.text);
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
