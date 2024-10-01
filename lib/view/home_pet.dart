import 'package:flutter/material.dart';
import 'package:pet_adopted/models/pet_model.dart';
 
class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.pets,
  });
 
  final List<PetModel> pets;
 
  @override
  Widget build(BuildContext context) {
    if (pets.isEmpty) {
      return Center(
        child: Text(
          'Nenhum usuário disponível',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
 
    // Usando ListView para renderizar múltiplos usuários, caso haja mais de um
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
      
 
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Column(
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
                        "Nome: ${pet.name}",
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
                      SizedBox(height: 8),
                      Text(
                        "Idade: ${pet.age}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Location: ${pet.location}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
 