import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promocoes/classes/classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hover = false;

  // hover() {
  //   print('hover');
  // }

  // hoverExit() {
  //   print('hoverExit');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.marromMedio,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                width: 500,
                height: 350,
                decoration: BoxDecoration(
                  color: Cores.marrom,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/baner.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Divider(
                color: Cores.branco,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        print('Clicou');
                      },
                      onHover: (value) {
                        setState(() {
                          hover = value;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.only(bottom: hover ? 35 : 0),
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Cores.marrom,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Cores.branco,
                            width: 2,
                          ),
                          boxShadow: hover
                              ? [
                                  const BoxShadow(
                                    color: Cores.branco,
                                    blurRadius: 15,
                                  ),
                                ]
                              : null,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.person_add_solid,
                              color: Cores.branco,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Cadastrar-se',
                              style: TextStyle(
                                color: Cores.branco,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Cores.marrom,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Cores.branco,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.tickets_fill,
                          color: Cores.branco,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Novo Cupom',
                          style: TextStyle(
                            color: Cores.branco,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Cores.marrom,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Cores.branco,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.gift_fill,
                          color: Cores.branco,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Sorteios',
                          style: TextStyle(
                            color: Cores.branco,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 100,
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
      // child: Text(
      //   'Promoções',
      //   style: TextStyle(
      //     color: Cores.marromClaro,
      //     fontSize: 30,
      //   ),
      // ),
    );
  }
}
