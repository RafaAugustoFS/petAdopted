import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/user_model.dart';
import 'package:pet_adopted/view/cadastro_user.dart';

class LoginForm extends StatefulWidget { 
  const LoginForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<LoginForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<UserModel> users = [];

  void salvaInfo() {
    users.add(UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(158, 255, 216, 171),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, color: Colors.black), // Ajuste a cor do texto conforme necessário
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.loginImage,
                    height: 250,
                  ),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email:',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha:',
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
                              child: Text("Login"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterForm(),
                                  ),
                                );
                              },
                              child: Text("Ainda não tenho uma conta"),
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
 