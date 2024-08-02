import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/cadastro_participantes_page.dart';
import 'package:promocoes/ui/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      scrollBehavior: Scroll(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/cupom': (context) => const CadastroParticipantesPage(),
      },
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
