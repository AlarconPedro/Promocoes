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
          children: [
            largura > 1000
                ? Stack(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Cores.marrom,
                            color: Cores.branco,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/banner_grande.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: Globais.layout == Layout.mobile ||
                                      Globais.layout == Layout.smartphone
                                  ? const EdgeInsets.only(left: 10, right: 10)
                                  : const EdgeInsets.only(left: 45, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          builder: (context) =>
                                              const MeusCuponsPage(),
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
                              ),
                            ),
                          ),
                          // Globais.layout == Layout.mobile ||
                          //         Globais.layout == Layout.smartphone
                          //     ? const SizedBox()
                          //     : const Expanded(child: SizedBox()),
                          largura > 1500
                              ? const Expanded(child: SizedBox())
                              : const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 0, bottom: 0, top: 360),
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
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
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
                      Container(
                        width: MediaQuery.of(context).size.width,
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
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
            largura > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: SizedBox(
                      //definir altura de acordo com o espaço disponível
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Como Funciona",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Mussum Ipsum, cacilds vidis litro abertis."
                                    "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. "
                                    "Aenean sit amet nisi. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. "
                                    "Sed non consequat odio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! "
                                    "Manduma pindureta quium dia nois paga.",
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Como Participar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Mussum Ipsum, cacilds vidis litro abertis."
                                    "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. "
                                    "Aenean sit amet nisi. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. "
                                    "Sed non consequat odio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! "
                                    "Manduma pindureta quium dia nois paga.",
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Como Saber se Ganhei",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Mussum Ipsum, cacilds vidis litro abertis."
                                    "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. "
                                    "Aenean sit amet nisi. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. "
                                    "Sed non consequat odio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! "
                                    "Manduma pindureta quium dia nois paga.",
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          //definir altura de acordo com o espaço disponível
                          height: 1000,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Como Funciona",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Mussum Ipsum, cacilds vidis litro abertis."
                                        "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. "
                                        "Aenean sit amet nisi. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. "
                                        "Sed non consequat odio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! "
                                        "Manduma pindureta quium dia nois paga.",
                                        textAlign: TextAlign.justify,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Como Participar",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Mussum Ipsum, cacilds vidis litro abertis."
                                        "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. "
                                        "Aenean sit amet nisi. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. "
                                        "Sed non consequat odio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! "
                                        "Manduma pindureta quium dia nois paga.",
                                        textAlign: TextAlign.justify,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
            Row(
              children: [
                Container(
                  color: Cores.marrom,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          ],
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       width: MediaQuery.of(context).size.width,
        //       color: Cores.branco,
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                     left: 0, right: 0, bottom: 10),
        //                 child: Container(
        //                   width: MediaQuery.of(context).size.width * 0.3,
        //                   // height: MediaQuery.of(context).size.height * 0.3,
        //                   decoration: BoxDecoration(
        //                     // color: Cores.marrom,
        //                     color: Cores.branco,
        //                     borderRadius: BorderRadius.circular(10),
        //                   ),
        //                   child: ClipRRect(
        //                     // borderRadius: BorderRadius.circular(10),
        //                     child: Image.asset(
        //                       'images/pix.jpeg',
        //                       fit: BoxFit.fitHeight,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                     left: 0, right: 0, bottom: 10),
        //                 child: Container(
        //                   width: MediaQuery.of(context).size.width * 0.7,
        //                   // height: MediaQuery.of(context).size.height * 0.3,
        //                   decoration: BoxDecoration(
        //                     // color: Cores.marrom,
        //                     color: Cores.branco,
        //                     borderRadius: BorderRadius.circular(10),
        //                   ),
        //                   child: ClipRRect(
        //                     // borderRadius: BorderRadius.circular(10),
        //                     child: Image.asset(
        //                       'images/banner_grande.png',
        //                       fit: BoxFit.fitHeight,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(10),
        //         child: largura > 700
        //             ? Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   BotaoContainer(
        //                     icone: CupertinoIcons.add_circled_solid,
        //                     titulo: 'Cadastrar Cupom',
        //                     onTap: () {
        //                       Navigator.push(
        //                         context,
        //                         CupertinoDialogRoute(
        //                           builder: (context) =>
        //                               const CadastroParticipantesPage(),
        //                           context: context,
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                   BotaoContainer(
        //                     icone: CupertinoIcons.tickets_fill,
        //                     titulo: 'Meus Cupons',
        //                     onTap: () {
        //                       Navigator.push(
        //                         context,
        //                         CupertinoDialogRoute(
        //                           builder: (context) => const MeusCuponsPage(),
        //                           context: context,
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                   BotaoContainer(
        //                     icone: CupertinoIcons.gift_fill,
        //                     titulo: 'Sorteios',
        //                     onTap: () {
        //                       Navigator.push(
        //                         context,
        //                         CupertinoDialogRoute(
        //                           builder: (context) => SorteiosPage(
        //                             onClique: () {
        //                               Navigator.pop(context);
        //                             },
        //                           ),
        //                           context: context,
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ],
        //               )
        //             : Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.all(4),
        //                     child: BotaoContainer(
        //                       icone: CupertinoIcons.add_circled_solid,
        //                       titulo: 'Cadastrar Cupom',
        //                       onTap: () {
        //                         Navigator.push(
        //                           context,
        //                           CupertinoDialogRoute(
        //                             builder: (context) =>
        //                                 const CadastroParticipantesPage(),
        //                             context: context,
        //                           ),
        //                         );
        //                       },
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(4),
        //                     child: BotaoContainer(
        //                       icone: CupertinoIcons.tickets_fill,
        //                       titulo: 'Meus Cupons',
        //                       onTap: () {
        //                         Navigator.push(
        //                           context,
        //                           CupertinoDialogRoute(
        //                             builder: (context) =>
        //                                 const MeusCuponsPage(),
        //                             context: context,
        //                           ),
        //                         );
        //                       },
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(4),
        //                     child: BotaoContainer(
        //                       icone: CupertinoIcons.gift_fill,
        //                       titulo: 'Sorteios',
        //                       onTap: () {
        //                         Navigator.push(
        //                           context,
        //                           CupertinoDialogRoute(
        //                             builder: (context) => SorteiosPage(
        //                               onClique: () {
        //                                 Navigator.pop(context);
        //                               },
        //                             ),
        //                             context: context,
        //                           ),
        //                         );
        //                       },
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
