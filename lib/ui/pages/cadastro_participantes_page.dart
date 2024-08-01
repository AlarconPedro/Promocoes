import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../classes/classes.dart';
import '../widgets/botao_container.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantes extends StatefulWidget {
  const CadastroParticipantes({super.key});

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
  double largura = 400;
  double altura = 400;

  final PageController _pageController = PageController();

  Widget _paginaCadastro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Flexible(
          fit: FlexFit.loose,
          child: Container(
            // width: 800,
            width: largura,
            // height: 650,
            height: altura,
            decoration: BoxDecoration(
              color: Cores.branco,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Cores.cinza,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Text(
                    'Cadastro de Participantes',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CampoFormulario(label: 'CPF'),
                        CampoFormulario(label: 'Nome'),
                        CampoFormulario(label: 'E-mail'),
                        CampoFormulario(label: 'Telefone'),
                        CampoFormulario(label: 'Cidade'),
                        CampoFormulario(label: 'UF'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   color: Cores.marrom,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         color: Cores.marrom,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               width: MediaQuery.of(context).size.width * 0.8,
    //               height: MediaQuery.of(context).size.height * 0.8,
    //               color: Cores.branco,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   CampoFormulario(label: 'Nome'),
    //                   CampoFormulario(label: 'E-mail'),
    //                   CampoFormulario(label: 'Telefone'),
    //                   CampoFormulario(label: 'CPF'),
    //                   CampoFormulario(label: 'Data de Nascimento'),
    //                   CampoFormulario(label: 'Endereço'),
    //                   CampoFormulario(label: 'Número'),
    //                   CampoFormulario(label: 'Complemento'),
    //                   CampoFormulario(label: 'Bairro'),
    //                   CampoFormulario(label: 'Cidade'),
    //                   CampoFormulario(label: 'Estado'),
    //                   CampoFormulario(label: 'CEP'),
    //                   CampoFormulario(label: 'Senha'),
    //                   CampoFormulario(label: 'Confirmação de Senha'),
    //                   BotaoContainer(
    //                     texto: 'Cadastrar',
    //                     cor: Cores.marrom,
    //                     corTexto: Cores.branco,
    //                     onPressed: () {},
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _paginaEntrar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Flexible(
          fit: FlexFit.loose,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: largura,
            height: altura,
            decoration: BoxDecoration(
              color: Cores.branco,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Cores.cinza,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Cadastro de Participantes',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CampoFormulario(label: 'E-mail'),
                CampoFormulario(label: 'Senha'),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paginaEscolha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Flexible(
          fit: FlexFit.loose,
          child: Container(
            width: 800,
            height: 650,
            decoration: BoxDecoration(
              color: Cores.branco,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Cores.cinza,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Cadastro de Participantes',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _paginaCadastro(context),
                        ),
                      );
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _paginaEntrar(context),
                        ),
                      );
                    },
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Cores.verde,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _paginaEntrar(context),
          _paginaCadastro(context),
          // _paginaEscolha(context),
        ],
      ),
    );
  }
}
