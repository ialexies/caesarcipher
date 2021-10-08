import 'package:caesarcipher/app/modules/encode_decode/view/decode_view.dart';
import 'package:caesarcipher/app/modules/encode_decode/view/encode_view.dart';
import 'package:caesarcipher/app/modules/validate/view/validated_view.dart';
import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  final pages = [
    EncodeView(),
    Decode(),
    // ValidateView(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  ontap(int index) {
    setState(() {
      _controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: pages,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.amber[800],
                backgroundColor: Colors.amber,
                currentIndex: this.pageIndex,
                onTap: ontap,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Encrypt',
                    icon: Icon(Icons.ac_unit),
                  ),
                  BottomNavigationBarItem(
                    label: 'Decrypt',
                    icon: Icon(Icons.ac_unit),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
