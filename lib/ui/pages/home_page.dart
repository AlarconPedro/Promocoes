import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';
import 'package:promocoes/classes/layouts.dart';
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
      backgroundColor: Cores.marromMedio,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Cores.marrom,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Promoção',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Cores.marrom,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/baner.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: largura > 700
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BotaoContainer(
                              icone: CupertinoIcons.person_add_solid,
                              titulo: 'Cadastrar-se',
                              layout: layout,
                              onTap: () {
                                print('Clicou');
                              },
                            ),
                            BotaoContainer(
                              icone: CupertinoIcons.tickets_fill,
                              titulo: 'Novo Cupom',
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
                                icone: CupertinoIcons.person_add_solid,
                                titulo: 'Cadastrar-se',
                                layout: layout,
                                onTap: () {
                                  print('Clicou');
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: BotaoContainer(
                                icone: CupertinoIcons.tickets_fill,
                                titulo: 'Novo Cupom',
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
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Cores.marrom,
                  child: const Center(
                    child: Text(
                      'Rodapé',
                      style: TextStyle(
                        color: Cores.branco,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
