import 'package:caesarcipher/app/constants/box_decorations.dart';
import 'package:flutter/material.dart';

class TextFieldEncoderInput extends StatelessWidget {
  const TextFieldEncoderInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 3,
      maxLines: 8,
      keyboardType: TextInputType.multiline,
      decoration: BoxDecorations().decoration_encoder_input_words(),
    );
  }
}
