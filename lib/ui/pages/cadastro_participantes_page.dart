import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../classes/classes.dart';
import '../widgets/botao_container.dart';
import '../widgets/campo_formulario.dart';

class CadastroParticipantes extends StatefulWidget {
  const CadastroParticipantes({super.key});

  @override
  State<CadastroParticipantes> createState() => _CadastroParticipantesState();
}

class _CadastroParticipantesState extends State<CadastroParticipantes> {
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
                      // Navigator.pop(context);
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Cadastro de Participantes',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CampoFormulario(label: 'E-mail'),
                      CampoFormulario(label: 'Senha'),
                    ],
                  ),
                ),
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

  // Widget _paginaEscolha(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(30),
  //     child: Center(
  //       child: Flexible(
  //         fit: FlexFit.loose,
  //         child: Container(
  //           width: 800,
  //           height: 650,
  //           decoration: BoxDecoration(
  //             color: Cores.branco,
  //             borderRadius: BorderRadius.circular(20),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Cores.cinza,
  //                 blurRadius: 10,
  //                 offset: Offset(0, 5),
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             children: [
  //               const Padding(
  //                 padding: EdgeInsets.all(20),
  //                 child: Text(
  //                   'Cadastro de Participantes',
  //                   style: TextStyle(
  //                     color: Cores.preto,
  //                     fontSize: 24,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(20),
  //                 child: CupertinoButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => _paginaCadastro(context),
  //                       ),
  //                     );
  //                   },
  //                   padding:
  //                       const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
  //                   color: Cores.verde,
  //                   child: const Text(
  //                     'Entrar',
  //                     style: TextStyle(
  //                       color: Cores.branco,
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(20),
  //                 child: CupertinoButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => _paginaEntrar(context),
  //                       ),
  //                     );
  //                   },
  //                   padding:
  //                       const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
  //                   color: Cores.verde,
  //                   child: const Text(
  //                     'Entrar',
  //                     style: TextStyle(
  //                       color: Cores.branco,
  //                       fontSize: 18,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _paginaCupons(BuildContext context) {
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Cadastro de Cupons',
                    style: TextStyle(
                      color: Cores.preto,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Cupom",
                              labelStyle: const TextStyle(
                                color: Cores.preto,
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // _pageController.animateToPage(
                            //   1,
                            //   duration: const Duration(milliseconds: 500),
                            //   curve: Curves.easeInOut,
                            // );
                          },
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          color: Cores.verde,
                          child: const Text(
                            'Adicionar',
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
                // CampoFormulario(label: 'Cupom'),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Cupom $index'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              print('Clicou');
                            },
                          ),
                        );
                      }),
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
          _paginaCupons(context),
          // _paginaEscolha(context),
        ],
      ),
    );
  }
}
