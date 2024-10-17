import 'package:flutter/material.dart';

class infoCard extends StatelessWidget {
  const infoCard({
    super.key,
    required this.info,
  });

  final String info;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          info,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}