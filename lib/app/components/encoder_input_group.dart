import 'package:flutter/material.dart';
import 'package:caesarcipher/app/components/comp_rounded_button.dart';
import 'package:caesarcipher/app/components/textfield_encoder_input.dart';

class EncoderInputGroup extends StatelessWidget {
  const EncoderInputGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                CompRoundedButton(
                  btnTitle: "Generate Phrase",
                  bgColor: Colors.blue,
                  outlineColor: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    'Words: 4',
                    style: TextStyle(fontSize: 14),
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
                  child: TextFieldEncoderInput(),
                )
              ],
            ),
          ],
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
