import 'package:flutter/material.dart';

class BoxDecorations {
  BoxDecoration mainBgDecoration(
      {String imgUrl = 'images/backgrounddots.jpeg'}) {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: AssetImage(imgUrl),
      ),
    );
  }

  InputDecoration decoration_encoder_input_words() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white70,
      border: OutlineInputBorder(
        borderSide: new BorderSide(color: Colors.white),
      ),
    );
  }
}
