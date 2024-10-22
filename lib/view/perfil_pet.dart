import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/widgets/buildInfoCard.dart';

class PetDetailPage extends StatelessWidget {
  final PetModel pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pet'),
        backgroundColor: Color(0xFFDFF2EB), // Cor do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    pet.species.toLowerCase() == 'cachorro'
                        ? AppImages.cachorroImage
                        : pet.species.toLowerCase() == 'gato'
                            ? AppImages.gatoImage
                            : AppImages.defaultAnimal,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              infoCard(info: "Espécie: ${pet.species}"),
              infoCard(info: "Raça: ${pet.race}"),
              infoCard(info: "Nome: ${pet.name}"),
              infoCard(info: "Idade: ${pet.age}"),
              infoCard(info: "Localização: ${pet.location}"),
            ],
          ),
        ),
      ),
    );
  }
}


