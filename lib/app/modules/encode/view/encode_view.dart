import 'package:caesarcipher/app/components/encoder_input_group.dart';
import 'package:caesarcipher/app/components/header.dart';
import 'package:caesarcipher/app/components/result_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/painting.dart';
import 'package:caesarcipher/app/constants/box_decorations.dart';

class EncodeView extends StatefulWidget {
  const EncodeView({Key? key}) : super(key: key);

  @override
  _EncodeViewState createState() => _EncodeViewState();
}

class _EncodeViewState extends State<EncodeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            Opacity(
              opacity: .4,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecorations().mainBgDecoration(),
                ),
              ),
            ),
            Header(
              haderSubitle: '[ Generate & Encrypt a word]',
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  EncoderInputGroup(),
                  ResultText(),
                ],
              ),
            ),
          ],
        ));
  }
}
