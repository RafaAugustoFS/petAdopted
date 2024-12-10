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
  List<PetModel> pets = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPets();
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
        backgroundColor: Color(0xFF7AB2D3), // Cor mais vibrante
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pet Adopted',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
              ? Center(
                  child: Text(
                    errorMessage.isEmpty ? 'No pets available' : errorMessage,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
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
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        itemCount: pets.length,
                        separatorBuilder: (context, index) => Divider(),
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
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: CardAnimals(
                                          pet: pet,
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
        backgroundColor: Color(0xFF7AB2D3), // Cor mais vibrante
      ),
    );
  }
}
