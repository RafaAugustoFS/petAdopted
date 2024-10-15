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
        backgroundColor: Color.fromARGB(158, 255, 216, 171), // Cor do AppBar
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
              _buildInfoCard("Espécie: ${pet.species}"),
              _buildInfoCard("Raça: ${pet.race}"),
              _buildInfoCard("Nome: ${pet.name}"),
              _buildInfoCard("Idade: ${pet.age}"),
              _buildInfoCard("Localização: ${pet.location}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String info) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          info,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
