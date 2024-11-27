import 'package:flutter/material.dart';
import 'package:pet_adopted/constants/images_assets.dart';
import 'package:pet_adopted/models/pet_model.dart'; // Usando o modelo PetModel para mapear os dados

class CardAnimals extends StatelessWidget {
  final PetModel pet; // Recebendo um objeto PetModel
  final bool isNetworkImage;

  const CardAnimals({
    Key? key,
    required this.pet,
    this.isNetworkImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pegando os dados do PetModel
    final String displayName = pet.name;
    final String displayAge = pet.age.toString();
    final String displayColor = pet.color;
    final String displayImagePath = pet.imageUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: isNetworkImage
              ? Image.network(
                  displayImagePath,
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 100,
                      width: 160,
                      alignment: Alignment.center,
                      color: Colors.grey[300],
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return _fallbackImage();
                  },
                )
              : Image.asset(
                  displayImagePath,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _fallbackImage();
                  },
                ),
        ),
        SizedBox(height: 5),
        Text(
          displayName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 2),
        Row(
          children: [
            Text(
              'Idade: $displayAge',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(width: 5),
            Text(
              'Cor: $displayColor',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  // Widget de fallback para imagens quebradas
  Widget _fallbackImage() {
    return Container(
      height: 150,
      width: 160,
      alignment: Alignment.center,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
          SizedBox(height: 8),
          Text(
            'Imagem indisponível',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
