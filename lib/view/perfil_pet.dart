import 'package:flutter/material.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/widgets/buildInfoCard.dart';

class PetDetailPage extends StatelessWidget {
  final PetModel pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    
    final String displayImagePath = pet.imageUrl;
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
                  child: Image.network(
                    displayImagePath,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              infoCard(info: "Nome: ${pet.name}"),
              infoCard(info: "Cor: ${pet.color}"),
              infoCard(info: "Idade: ${pet.age} anos"),
              infoCard(info: "Raça: ${pet.color}"),
              infoCard(info: "Peso: ${pet.weight} kg"),
              infoCard(info: "Raça: ${pet.breed}"),
              infoCard(info: "Gênero: ${pet.gender}"),
              infoCard(info: "Categoria: ${pet.category}"),
              infoCard(info: "História: ${pet.story}")
            ],
          ),
        ),
      ),
    );
  }
}


