import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';

class PetDetailPage extends StatelessWidget {
  final PetModel pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Espécie: ${pet.species}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Raça: ${pet.race}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              "Nome: ${pet.name}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              "Idade: ${pet.age}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              "Localização: ${pet.location}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Image.asset(
              pet.species.toLowerCase() == 'cachorro'
                  ? AppImages.cachorroImage
                  : AppImages.gatoImage,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
