class PetModel {
  final String name;
  final String species;
  final String race;
  final String age;
  final String location;
  final String image;

  PetModel({
    required this.name,
    required this.species,
    required this.race,
    required this.age,
    required this.location,
    required this.image,
  });

  // Método de fábrica para mapear o JSON para o PetModel
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['title'], // Aqui estou usando 'title' do JSON de exemplo
      species: json['category'], // Ajuste conforme os dados da API
      race: json['description'], // Ajuste conforme os dados da API
      age: json['price'].toString(), // Ajuste conforme os dados da API
      location: json['rating']['rate'].toString(), // Ajuste conforme os dados da API
      image: json['image'], // Supondo que tenha um campo 'image'
    );
  }
}
