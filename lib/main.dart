import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promocoes/ui/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      scrollBehavior: Scroll(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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
