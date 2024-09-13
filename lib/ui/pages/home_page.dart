import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';
import 'package:promocoes/classes/layouts.dart';
import 'package:promocoes/ui/pages/cadastro_participantes_page.dart';
import 'package:promocoes/ui/pages/listar_cupons.dart';
import 'package:promocoes/ui/pages/meus_cupons_page.dart';
import 'package:promocoes/ui/pages/sorteios_page.dart';
import 'package:promocoes/ui/widgets/botao_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double largura = 0;
  double altura = 0;

  calcularTamanhoTela(BuildContext _) {
    largura = Funcoes.calcularTamanhoTela(_);
  }

  @override
  Widget build(BuildContext context) {
    calcularTamanhoTela(context);
    return Scaffold(
      // backgroundColor: Cores.marromMedio,
      backgroundColor: Cores.branco,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Cores.branco,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            // color: Cores.marrom,
                            color: Cores.branco,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/pix.jpeg',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            // color: Cores.marrom,
                            color: Cores.branco,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/banner_grande.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: largura > 700
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BotaoContainer(
                            icone: CupertinoIcons.add_circled_solid,
                            titulo: 'Cadastrar Cupom',
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoDialogRoute(
                                  builder: (context) =>
                                      const CadastroParticipantesPage(),
                                  context: context,
                                ),
                              );
                            },
                          ),
                          BotaoContainer(
                            icone: CupertinoIcons.tickets_fill,
                            titulo: 'Meus Cupons',
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoDialogRoute(
                                  builder: (context) => const MeusCuponsPage(),
                                  context: context,
                                ),
                              );
                            },
                          ),
                          BotaoContainer(
                            icone: CupertinoIcons.gift_fill,
                            titulo: 'Sorteios',
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoDialogRoute(
                                  builder: (context) => SorteiosPage(
                                    onClique: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  context: context,
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: BotaoContainer(
                              icone: CupertinoIcons.add_circled_solid,
                              titulo: 'Cadastrar Cupom',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                    builder: (context) =>
                                        const CadastroParticipantesPage(),
                                    context: context,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: BotaoContainer(
                              icone: CupertinoIcons.tickets_fill,
                              titulo: 'Meus Cupons',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                    builder: (context) =>
                                        const MeusCuponsPage(),
                                    context: context,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: BotaoContainer(
                              icone: CupertinoIcons.gift_fill,
                              titulo: 'Sorteios',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                    builder: (context) => SorteiosPage(
                                      onClique: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    context: context,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
