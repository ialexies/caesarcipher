import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              opacity: .6,
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
                    // width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      border: Border.all(color: Colors.black, width: 3),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('images/header_clouds.jpeg'),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xC20085FF),
                            Color(0xC27EDDFF),
                            Color(0xDE84F082),
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'CAESAR CIPHER',
                          style: TextStyle(
                            color: Color(0xFF006887),
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
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
                    child: Text('fdf'),
                    margin: EdgeInsets.only(top: 180),
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      color: const Color.fromRGBO(15, 211, 223, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
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
