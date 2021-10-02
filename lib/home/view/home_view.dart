import 'package:caesarcipher/encode/view/encode_view.dart';
import 'package:caesarcipher/validate/view/validated_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 0,
    // scro
  );
  int pageIndex = 0;

  final pages = const [
    EncodeView(),
    ValidateView(),
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('CAESAR CIPHER'),
      // ),
      body: PageView(
        controller: _controller,
        // physics: BouncingScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
