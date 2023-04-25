import 'package:app_curso/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.check_outlined,
          color: Colors.white,
        ),
        //Titulo do app
        backgroundColor: Colors.black,
        title: const Text('Minhas tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task('Aprender Flutter', 'assets/images/flutter.png', 4),
            Task('Andar de Bike', 'assets/images/bicicleta.jpg', 1),
            Task('Meditar', 'assets/images/meditar.jpg', 5),
            Task('Ler', 'assets/images/leitura.jpg', 4),
            Task('Jogar', 'assets/images/logo_lol.jpg', 1),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: const Color.fromARGB(192, 6, 110, 245),
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
