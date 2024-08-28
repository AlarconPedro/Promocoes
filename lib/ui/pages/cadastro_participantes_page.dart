import 'package:flutter/material.dart';
import 'package:promocoes/api/api_promocao.dart';
import 'package:promocoes/ui/pages/cadastro_participantes.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/logar_sistema.dart';

import '../../models/participante_model.dart';

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
      setState(() {
        participante = ParticipanteModel.fromJson(response.data);
      });
    } else {
      setState(() {
        participante = ParticipanteModel(
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
      });
    }
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => carregando = false);
  }

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
          LogarSistema(
            onClick: (cpf) {
              return buscarDadosUsuario(cpf);
            },
            carregando: carregando,
          ),
          CadastroParticipantes(
            onClique: () {
              _pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            participante: participante.parCodigo == 0 ? null : participante,
          ),
          ListarCupons(onClique: () {}),
        ],
      ),
    );
  }
}
