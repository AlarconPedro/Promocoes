import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/logar_sistema.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';
import '../../models/participante_model.dart';

class MeusCuponsPage extends StatefulWidget {
  const MeusCuponsPage({super.key});

  @override
  State<MeusCuponsPage> createState() => _MeusCuponsPageState();
}

class _MeusCuponsPageState extends State<MeusCuponsPage> {
  double altura = 650;
  double largura = 650;

  PageController pageController = PageController();

  bool carregando = false;

  ParticipanteModel participante = ParticipanteModel(
    parCidade: '',
    parCpf: '',
    parEmail: '',
    parEndereco: '',
    parCodigo: 0,
    parDataNasc: '',
    parFone: '',
    parNome: '',
    parUf: '',
    proCodigo: 0,
  );

  buscarDadosUsuario(String text) async {
    setState(() => carregando = true);
    try {
      var response = await ApiPromocao().getDadosParticipante(text);
      if (response.statusCode == 200) {
        setState(() {
          participante = ParticipanteModel.fromJson(json.decode(response.body));
        });
      } else {
        setState(() {
          participante = ParticipanteModel(
            parCidade: '',
            parCpf: text,
            parEmail: '',
            parEndereco: '',
            parCodigo: 0,
            parDataNasc: '',
            parFone: '',
            parNome: '',
            parUf: '',
            proCodigo: 0,
          );
        });
      }
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      setState(() => carregando = false);
      print(e);
      // _pageController.animateToPage(
      //   1,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.easeInOut,
      // );
    }
    setState(() => carregando = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LogarSistema(
              onClick: (cpf) => buscarDadosUsuario(cpf),
              carregando: carregando),
          ListarCupons(
            codigoParticipante: participante.parCodigo,
            voltar: () {
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onClique: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
