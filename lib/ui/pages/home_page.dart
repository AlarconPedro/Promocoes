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
                      Container(
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
                  )
                : Column(
                    children: [
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
                      const SizedBox(height: 10),
                    ],
                  ),
            largura > 1000
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: SizedBox(
                          //definir altura de acordo com o espaço disponível
                          // height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Objetivo",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Através das doações recebidas da comunidade, "
                                      "esta ação entre amigos tem como objetivo dar continuidade nas obras de conclusão dos novos dormitórios do Centro Catequético Maria de Nazaré, "
                                      "que encontram-se em fase de acabamento. ",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Como funciona?",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Ao adquirir um ou mais cupons, o doador concorre a cinco prêmios que serão sorteados nas datas informadas nesta página, como também impressa nos cupons."
                                      "Os sorteios serão realizados ao vivo nas suas respectivas datas através da página do facebook do Centro Catequético Maria de Nazaré "
                                      "(https://www.facebook.com/centrocatequeticomarianazare) "
                                      "Serão quatro prêmios de PIX no valor de R\$ 1.000,00 cada e no último sorteio será sorteado um automóvel Chevrolet Spin 2013.",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Como Participar?",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "A cada R\$ 50,00 doados, o doador receberá um cupom contendo um código que deverá ser cadastrado acessando o endereço http://acao.ccmn.org.br "
                                      "ou efetuando através da câmera do celular a leitura do QRCode que encontra-se no cupom "
                                      "Ao cadastrar o código, o doador já estará concorrendo a todos os prêmios. Quanto mais cupons adquirir, mais chances terá de ganhar.",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            padding: const EdgeInsets.all(10),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          //definir altura de acordo com o espaço disponível
                          height: largura < 680 ? 1200 : 1500,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Objetivo",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Através das doações recebidas da comunidade, "
                                      "esta ação entre amigos tem como objetivo dar continuidade nas obras de conclusão dos novos dormitórios do Centro Catequético Maria de Nazaré, "
                                      "que encontram-se em fase de acabamento. ",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Como funciona?",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Ao adquirir um ou mais cupons, o doador concorre a cinco prêmios que serão sorteados nas datas informadas nesta página, como também impressa nos cupons. "
                                      "Os sorteios serão realizados ao vivo nas suas respectivas datas através da página do facebook do Centro Catequético Maria de Nazaré "
                                      "(https://www.facebook.com/centrocatequeticomarianazare) "
                                      "Serão quatro prêmios de PIX no valor de R\$ 1.000,00 cada e no último sorteio será sorteado um automóvel Chevrolet Spin 2013.",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Como Participar?",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "A cada R\$ 50,00 doados, o doador receberá um cupom contendo um código que deverá ser cadastrado acessando o endereço http://acao.ccmn.org.br "
                                        "ou efetuando através da câmera do celular a leitura do QRCode que encontra-se no cupom "
                                        "Ao cadastrar o código, o doador já estará concorrendo a todos os prêmios. Quanto mais cupons adquirir, mais chances terá de ganhar.",
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
                              Padding(
                                padding: const EdgeInsets.all(10),
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
                              Padding(
                                padding: const EdgeInsets.all(10),
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
      ),
    );
  }
}
