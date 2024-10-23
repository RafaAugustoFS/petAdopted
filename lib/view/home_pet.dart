import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/view/cadastro_pet.dart';
import 'package:pet_adopted/view/perfil_pet.dart';
import 'package:pet_adopted/view/perfil_usuario.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.pets,
  });

  final List<PetModel> pets;

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
      body: Column(
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
                                child: Image.asset(
                                  imagePath,
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
