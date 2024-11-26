import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart'; // Supondo que o seu modelo PetModel seja utilizado para mapear os dados
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pet_adopted/view/cadastro_pet.dart';
import 'package:pet_adopted/view/perfil_pet.dart';
import 'package:pet_adopted/view/perfil_usuario.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<PetModel> pets = []; // Lista para armazenar os pets recebidos da API
  bool isLoading = true; // Para mostrar um indicador de carregamento enquanto os dados não chegam

  @override
  void initState() {
    super.initState();
    fetchPets(); // Chama a função que vai buscar os dados da API
  }

  // Função para buscar os dados dos pets
  Future<void> fetchPets() async {
    var url = "https://pet-adopt-dq32j.ondigitalocean.app/pet/pets"; // Substitua pela URL da sua API de pets
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      List<PetModel> fetchedPets = []; // Lista para armazenar os pets após o mapeamento

      for (var petData in jsonResponse) {
        // Mapeando cada pet recebido da API para um modelo PetModel
        fetchedPets.add(PetModel.fromJson(petData));
      }

      setState(() {
        pets = fetchedPets; // Atualiza a lista de pets com os dados recebidos
        isLoading = false; // Finaliza o carregamento
      });
    } else {
      // Se a resposta não for bem-sucedida
      print("Erro ao carregar os dados: ${response.statusCode}");
      setState(() {
        isLoading = false; // Finaliza o carregamento mesmo com erro
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFF2EB),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pet Adopted', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowUser(users: [])),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImages.user,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Indicador de carregamento
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.logo,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Animais disponíveis para adoção:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      final pet = pets[index];

                      String imagePath;
                      if (pet.species.toLowerCase() == 'cachorro') {
                        imagePath = AppImages.cachorroImage;
                      } else if (pet.species.toLowerCase() == 'gato') {
                        imagePath = AppImages.gatoImage;
                      } else {
                        imagePath = AppImages.defaultAnimal;
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetDetailPage(pet: pet),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Espécie: ${pet.species}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Raça: ${pet.race}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Nome: ${pet.name}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Idade: ${pet.age}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Localização: ${pet.location}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipOval(
                                      child: Image.network(
                                        pet.image,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetForm()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF7AB2D3),
      ),
    );
  }
}

