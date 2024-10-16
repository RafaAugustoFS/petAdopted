import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/view/cadastro_user.dart';
import 'package:pet_adopted/view/perfil_pet.dart';

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
  backgroundColor: Color.fromARGB(158, 255, 216, 171),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Pet adopted'),
      GestureDetector(
        onTap: () {
          // Navegar para outra página
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterForm()), // Substitua por sua página
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
            padding: EdgeInsets.all(8.0),
            child: Text('Animais disponíveis para adoção:'),
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
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Raça: ${pet.race}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Nome: ${pet.name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Idade: ${pet.age}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Localização: ${pet.location}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  imagePath,
                                  height: 100,
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
    );
  }
}
