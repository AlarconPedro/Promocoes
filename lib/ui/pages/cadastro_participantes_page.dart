import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/cadastro_participantes.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/logar_sistema.dart';

import '../../classes/classes.dart';
import '../widgets/botao_container.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantesPage extends StatefulWidget {
  const CadastroParticipantesPage({super.key});

  @override
  State<CadastroParticipantesPage> createState() =>
      _CadastroParticipantesPageState();
}

class _CadastroParticipantesPageState extends State<CadastroParticipantesPage> {
  double largura = 500;
  double altura = 320;

  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        if (_pageController.page == 0) {
          altura = 320;
          largura = 400;
        } else {
          altura = 650;
          largura = 650;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LogarSistema(onClick: () {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          CadastroParticipantes(onClique: () {
            _pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          // _paginaEntrar(context),
          // _paginaCadastro(context),
          ListarCupons(onClique: () {}),
          // _paginaEscolha(context),
        ],
      ),
    );
  }
}
