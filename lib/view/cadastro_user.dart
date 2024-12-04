import 'dart:convert'; // Para converter o corpo da requisição para JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para fazer a requisição HTTP
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/user_model.dart';
import 'package:pet_adopted/view/login_user.dart';

class RegisterForm extends StatefulWidget { 
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController(); // Novo controlador para a confirmação da senha
  TextEditingController phoneController = TextEditingController(); // Novo controlador para o telefone
  List<UserModel> users = [];

  // Função para enviar os dados para a API
  Future<void> submitForm() async {
    // Verifica se as senhas coincidem
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('As senhas não coincidem!')),
      );
      return;
    }

    final url = Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/register');
    
    // Corpo da requisição em formato JSON
    final body = json.encode({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirmpassword': confirmPasswordController.text,
      'phone': phoneController.text, // Adicionando o telefone ao corpo da requisição
    });

    try {
      // Enviando requisição POST
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
  // Se a resposta for bem-sucedida, navega para a tela de login
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Cadastro realizado com sucesso!')),
  );
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => LoginForm(),
    ),
  );
} else {
  // Exibe código de erro e corpo da resposta para diagnóstico
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Erro: ${response.statusCode} - ${response.body}')),
  );
  print('Erro ao cadastrar. Status code: ${response.statusCode}');
  print('Resposta da API: ${response.body}');
}
    } catch (e) {
      // Se ocorrer um erro ao fazer a requisição
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar. Tente novamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Color(0xFFDFF2EB),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  AppImages.loginImage,
                  height: 200,
                ),
                SizedBox(height: 30),
                Card(
                  color: Color(0xFFB9E5E8),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'Nome',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'Senha',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'Confirmar Senha',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone, // Definir o tipo de teclado para número de telefone
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelText: 'Telefone',
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                submitForm(); // Envia os dados para a API
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                backgroundColor: Color(0xFF7AB2D3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LoginForm(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                backgroundColor: Color(0xFF7AB2D3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
