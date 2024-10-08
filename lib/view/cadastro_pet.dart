import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart';
import 'package:pet_adopted/view/home_pet.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  TextEditingController speciesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController raceController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  List<PetModel> pets = [];

  void salvaInfo() {
    pets.add(PetModel(
      species: speciesController.text,
      name: nameController.text,
      race: raceController.text,
      age: ageController.text,
      location: locationController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(158, 255, 216, 171),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cadastrar novo animal',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.cachorroImage,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.gatoImage,
                    height: 150,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: speciesController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Espécie:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: raceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Raça:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Idade:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Localização:',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              salvaInfo();
                            },
                            child: Text("Cadastrar"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(pets: pets),
                                ),
                              );
                            },
                            child: Text("Voltar"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
