import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/logar_sistema.dart';

import '../../api/api_promocao.dart';
import '../../classes/classes.dart';
import '../../models/participante_model.dart';

class MeusCupons extends StatefulWidget {
  const MeusCupons({super.key});

  @override
  State<MeusCupons> createState() => _MeusCuponsState();
}

class _MeusCuponsState extends State<MeusCupons> {
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
    var response = await ApiPromocao().getDadosParticipante(text);
    if (response.statusCode == 200) {
      participante = ParticipanteModel.fromJson(response.data);
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
            onClique: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
