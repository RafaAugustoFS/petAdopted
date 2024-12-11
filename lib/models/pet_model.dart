class PetModel {
  final String name;
  final int age;
  final double weight;
  final String color;
  final String gender;
  final String breed;
  final String category;
  final String story;
  final List<String> images;
 
  PetModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.gender,
    required this.breed,
    required this.category,
    required this.story,
    required this.images,
  });
 
  /// Converte um JSON em uma instância de [PetModel].
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'] ?? 'Unknown', // Nome padrão se for null
      age: json['age'] ?? 0,           // Idade padrão
      weight: (json['weight'] ?? 0).toDouble(), // Peso padrão, convertido para double
      color: json['color'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
      breed: json['breed'] ?? 'Unknown',
      category: json['category'] ?? 'Unknown',
      story: json['story'] ?? 'Unknown',
      images: List<String>.from(json['images'] ?? []), // Garante uma lista vazia se null
    );
  }
 
  /// Converte uma instância de [PetModel] em JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'gender': gender,
      'breed': breed,
      'category': category,
      'story': story,
      'images': images,
    };
  }
 
  /// Retorna a URL da imagem principal (primeira imagem na lista).
  String get imageUrl {
    return images.isNotEmpty ? images[0] : ''; // Retorna a primeira imagem ou vazio
  }
 
  /// Retorna uma descrição fixa ou personalizada para o pet.
  String get description {
    return "Este é um pet adorável que está à espera de um lar.";
  }
}