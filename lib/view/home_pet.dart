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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard de Pets'),
      ),
      body: Column(
        children: [
          // Cabeçalho com imagens de pets
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'caminho/para/imagem/cachorro.png', // Substitua pelo caminho da imagem do cachorro
                    height: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'caminho/para/imagem/gato.png', // Substitua pelo caminho da imagem do gato
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                                "Localização: ${pet.location}",
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
            ),
          ),
        ],
      ),
    );
  }
}
