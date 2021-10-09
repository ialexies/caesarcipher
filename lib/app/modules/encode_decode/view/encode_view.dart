import 'package:caesarcipher/app/components/encoder_input_group.dart';
import 'package:caesarcipher/app/components/header.dart';
import 'package:caesarcipher/app/components/result_text.dart';
import 'package:caesarcipher/cipher_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:caesarcipher/app/constants/box_decorations.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class EncodeView extends StatelessWidget with GetItMixin {
  // const EncodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final getIsLoading = watchOnly((GetItCipherNotifier x) => x.isLoading);
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
