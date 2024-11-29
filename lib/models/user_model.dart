class UserModel {
  String name;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  
  /// Converte um JSON em uma instância de [PetModel].
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'Unknown', // Nome padrão se for null
      email: json['email'] ?? 'unkown',
      password: json['password'] ?? 'unkown'          // Idade padrão
    );
  }
 
  /// Converte uma instância de [PetModel] em JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password
    };
  }
}
