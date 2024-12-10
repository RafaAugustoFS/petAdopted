import 'dart:convert'; // Para trabalhar com JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para fazer requisição HTTP
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/view/home_pet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController raceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  List<PetModel> pets = [];

  // Função para enviar os dados para a API
  Future<void> submitPetForm() async {
    // Verificando se os campos estão preenchidos
    if (nameController.text.isEmpty ||
        colorController.text.isEmpty ||
        weightController.text.isEmpty ||
        ageController.text.isEmpty ||
        genderController.text.isEmpty ||
        raceController.text.isEmpty ||
        categoryController.text.isEmpty ||
        imageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    final url =
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/create');

    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('user_token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Token não encontrado. Faça login novamente.")),
      );
      return;
    }

    // Corpo da requisição em formato JSON
    final body = json.encode({
      'name': nameController.text,
      'color': colorController.text,
      'weight': weightController.text,
      'age': ageController.text,
      'gender': genderController.text,
      'race': raceController.text,
      'category': categoryController.text,
      'images': imageController.text,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", // Enviar o token na autorização
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // Se o cadastro for bem-sucedido, mostra uma mensagem
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pet cadastrado com sucesso!')),
        );

        // Volta para a tela inicial após o cadastro
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        // Se houver um erro ao cadastrar, exibe a mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar. Tente novamente.')),
        );
        print('Erro ao cadastrar. Status code: ${response.statusCode}');
        print('Resposta da API: ${response.body}');
      }
    } catch (e) {
      // Se ocorrer um erro de conexão
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar. Tente novamente.')),
      );
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF7AB2D3),
        body: SingleChildScrollView( // Adiciona o scroll
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cadastrar novo animal',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.cachorroImage,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.gatoImage,
                      height: 150,
                    ),
                  ),
                ],
              ),
              Card(
                color: Color(0xFFB9E5E8),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: colorController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cor:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: weightController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Peso:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Idade:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: genderController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Gênero:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: raceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Raça:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: categoryController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Categoria:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: imageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Imagem:',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed:
                                submitPetForm, // Enviar os dados para a API
                            child: Text("Cadastrar"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              );
                            },
                            child: Text("Voltar"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
