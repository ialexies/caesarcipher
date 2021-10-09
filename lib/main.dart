import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'app/modules/home/view/home_view.dart';
import 'cipher_notifier.dart';
import 'locator.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getIsLoading = watchOnly((GetItCipherNotifier x) => x.isLoading);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          MyHomePage(),

          getIsLoading
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(.8),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Text('')

          // Container(
          //   child: Center(child: CircularProgressIndicator()),
          // )
        ],
      ),
    );
  }
}
