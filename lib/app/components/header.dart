import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({
    this.haderSubitle = "[]",
    Key? key,
  }) : super(key: key);

  String haderSubitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 6)
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xC20085FF),
                    Color(0xC27EDDFF),
                    Color(0xDE84F082),
                  ]),
              border: Border.all(color: const Color(0xff00698F), width: 3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Opacity(
            opacity: .3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
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
                  child: Text(
                    'CAESAR CIPHER',
                    style: TextStyle(
                      color: Color(0xFF006887),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  // '[ Generate & Encrypt a word]',
                  '$haderSubitle',
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
    );
  }
}
