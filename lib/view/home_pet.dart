import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pet_adopted/view/cadastro_pet.dart';
import 'package:pet_adopted/view/cadastro_user.dart';
import 'package:pet_adopted/view/perfil_pet.dart';
import 'package:pet_adopted/widgets/cardAnimals.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<PetModel> pets = []; // Lista de pets do tipo PetModel
  bool isLoading = true; // Para mostrar um indicador de carregamento
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPets(); // Chama a função que vai buscar os dados da API
  }

  Future<void> fetchPets() async {
    const String apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body);
        setState(() {
          pets = (data['pets'] as List)
              .map((petData) => PetModel.fromJson(petData))
              .toList();
          isLoading = false;
        });
      } else {  
        setState(() {
          errorMessage = 'Falha ao carregar os dados. Código: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Erro: $e';
        isLoading = false;
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
                  MaterialPageRoute(builder: (context) => RegisterForm()),
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
          : pets.isEmpty
              ? Center(child: Text(errorMessage.isEmpty ? 'No pets available' : errorMessage))
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
                                        child: CardAnimals(
                                          pet: pet, // Passando o pet completo
                                          isNetworkImage: pet.imageUrl.startsWith('http'),
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
