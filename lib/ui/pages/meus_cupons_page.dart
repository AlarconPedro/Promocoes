import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/logar_sistema.dart';

import '../../classes/classes.dart';

class MeusCupons extends StatefulWidget {
  const MeusCupons({super.key});

  @override
  State<MeusCupons> createState() => _MeusCuponsState();
}

class _MeusCuponsState extends State<MeusCupons> {
  double altura = 650;
  double largura = 650;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LogarSistema(
            onClick: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          ListarCupons(
            onClique: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
