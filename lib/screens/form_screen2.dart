import 'package:flutter/material.dart';

class ScreenPageTest extends StatefulWidget {
  const ScreenPageTest({super.key});

  @override
  State<ScreenPageTest> createState() => _ScreenPageTestState();
}

class _ScreenPageTestState extends State<ScreenPageTest> {
  TextEditingController controleNome = TextEditingController();
  TextEditingController controleDificuldade = TextEditingController();
  TextEditingController controleImagem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.add_task_sharp,
          color: Colors.amber,
          size: 30,
        ),
        title: const Text(
          'Adicionar uma nova tarefa',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 375,
          height: 750,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 0.5,
              color: Colors.black,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //nome
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controleNome,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Nome',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              //dificuldade
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controleDificuldade,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Dificuldade',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              //imagem
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: controleImagem,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Imagem',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: Colors.black),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controleImagem.text,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/noPhoto.png');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // ignore: avoid_print
                  print(controleNome.text);
                  // ignore: avoid_print
                  print(int.parse(controleDificuldade.text));
                  // ignore: avoid_print
                  print(controleImagem.text);
                },
                icon: const Icon(Icons.touch_app_sharp),
                label: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
