import 'package:app_curso/screens/form_screen2.dart';
import 'package:flutter/material.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Titulo do app
        backgroundColor: Colors.black,
        title: const Text('Minhas tarefas'),
      ),
      body: ListView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenPageTest(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 6, 110, 245),
        child: const Icon(Icons.add),
      ),
    );
  }
}
