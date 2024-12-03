class UserModel {
  String name;
  String email;
  String password;
  String confirmPassword; // Adicionando o campo de confirmação da senha

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// Converte um JSON em uma instância de [UserModel].
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'Unknown', // Nome padrão se for null
      email: json['email'] ?? 'unknown', // Email padrão se for null
      password: json['password'] ?? 'unknown', // Senha padrão se for null
      confirmPassword: json['confirmPassword'] ?? 'unknown', // Confirmar senha padrão
    );
  }

  /// Converte uma instância de [UserModel] em JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword, // Incluindo confirmPassword no JSON
    };
  }
}
