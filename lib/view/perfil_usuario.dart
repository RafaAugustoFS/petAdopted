import 'package:flutter/material.dart';
import 'package:pet_adopted/models/user_model.dart';
 
class ShowUser extends StatelessWidget {
  const ShowUser({
    super.key,
    required this.users,
  });
 
  final List<UserModel> users;
 
  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Center(
        child: Text(
          'Nenhum usuário disponível',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
 
    // Usando ListView para renderizar múltiplos usuários, caso haja mais de um
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
      
 
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
                        "Nome: ${user.name}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Email: ${user.email}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Senha: Senha bloqueada, caso esqueça a senha entre em contato",
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