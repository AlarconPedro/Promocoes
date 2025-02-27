import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/final_promocao.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MaterialApp(
      scrollBehavior: Scroll(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/cupom': (context) => const FinalPromocao(),
      // },
      // home: const HomePage(),
      home: const FinalPromocao(),
    ),
  );
}

class Scroll extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
