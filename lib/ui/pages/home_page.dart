import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';
import 'package:promocoes/classes/layouts.dart';
import 'package:promocoes/ui/pages/cadastro_participantes_page.dart';
import 'package:promocoes/ui/widgets/botao_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double largura = 0;
  double altura = 0;

  Layout layout = Layout.desktop;

  calcularTamanhoTela() {
    largura = MediaQuery.of(context).size.width;
    altura = MediaQuery.of(context).size.height;
    switch (largura.toInt()) {
      case < 450:
        layout = Layout.mobile;
        break;
      case < 800:
        layout = Layout.smartphone;
        break;
      case < 1024:
        layout = Layout.tablet;
        break;
      case > 1024:
        layout = Layout.desktop;
        break;
      default:
        layout = Layout.desktop;
    }
    // print('Largura: ${MediaQuery.of(context).size.width}');
    // print('Altura: ${MediaQuery.of(context).size.height}');
    definirLayout();
  }

  definirLayout() {}

  @override
  Widget build(BuildContext context) {
    calcularTamanhoTela();
    return Scaffold(
      backgroundColor: Cores.branco,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Cores.branco,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Cores.marrom,
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Cores.marromMedio,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: largura > 700
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BotaoContainer(
                                icone: CupertinoIcons.add_circled_solid,
                                titulo: 'Cadastrar Cupom',
                                layout: layout,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoDialogRoute(
                                      builder: (context) =>
                                          const CadastroParticipantes(),
                                      context: context,
                                    ),
                                  );
                                },
                              ),
                              BotaoContainer(
                                icone: CupertinoIcons.tickets_fill,
                                titulo: 'Meus Cupons',
                                layout: layout,
                                onTap: () {
                                  print('Clicou');
                                },
                              ),
                              BotaoContainer(
                                icone: CupertinoIcons.gift_fill,
                                titulo: 'Sorteios',
                                layout: layout,
                                onTap: () {
                                  print('Clicou');
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
                                  layout: layout,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoDialogRoute(
                                        builder: (context) =>
                                            const CadastroParticipantes(),
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
                                  layout: layout,
                                  onTap: () {
                                    print('Clicou');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: BotaoContainer(
                                  icone: CupertinoIcons.gift_fill,
                                  titulo: 'Sorteios',
                                  layout: layout,
                                  onTap: () {
                                    print('Clicou');
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
          const Spacer(),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                color: Cores.marromMedio,
                child: Center(
                  child: Text(
                    'Rodapé',
                    style: TextStyle(
                      color: Cores.preto,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
