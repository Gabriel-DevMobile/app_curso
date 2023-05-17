// ignore_for_file: avoid_print

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Adicionar uma nova tarefa',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                  const Text(
                    'Adicionar nova Tarefa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Anton',
                    ),
                  ),
                  //nome
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira um URL de Imagem';
                        }
                        return null;
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
                      if (_formKey.currentState!.validate()) {
                        print(controleNome.text);
                        print(int.parse(controleDificuldade.text));
                        print(controleImagem.text);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Salvando nova Tarefa',
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.library_add_rounded),
                    label: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
