import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

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
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/backgrounddots.jpeg'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    // color: Colors.white,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            spreadRadius: 6)
                      ],
                      // border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xC20085FF),
                            Color(0xC27EDDFF),
                            Color(0xDE84F082),
                          ]),
                      // boxShadow: [BoxShadow(color: Colors.black)],
                      border: Border.all(color: Color(0xff00698F), width: 3),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Opacity(
                    opacity: .3,
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('images/header_clouds.jpeg'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BorderedText(
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                          child: const Text(
                            'CAESAR CIPHER',
                            style: TextStyle(
                              color: Color(0xFF006887),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const Text(
                          '[ Generate & Encrypt a word]',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Generate Phrase',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Center(
                                  child: Text(
                                    'Words: 4',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    minLines: 3,
                                    maxLines: 8,
                                    keyboardType: TextInputType.multiline,
                                    // maxLines: null,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white70,
                                      border: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 180),
                    // height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      color: const Color.fromRGBO(15, 211, 223, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Colors.white.withOpacity(.5),
                        width: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          'CLICK THE BUTTON GENERAGE PHRASE',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
