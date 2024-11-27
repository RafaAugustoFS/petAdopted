import 'package:flutter/material.dart';
 
class CardAnimals extends StatefulWidget {
  final String? name;
  final String? age;
  final String? color;
  final String? imagePath;
  final bool isNetworkImage;
 
  const CardAnimals({
    Key? key,
    required this.name,
    required this.age,
    required this.color,
    required this.imagePath,
    this.isNetworkImage = false,
  }) : super(key: key);
 
  @override
  _CardAnimalsState createState() => _CardAnimalsState();
}
 
class _CardAnimalsState extends State<CardAnimals> {
  @override
  Widget build(BuildContext context) {
    // Valores padrão para evitar nulos
    final String displayName = widget.name ?? 'Unknown';
    final String displayAge = widget.age ?? 'Age not available |';
    final String displayColor = widget.color ?? 'color not available';
    final String displayImagePath = widget.imagePath ?? 'assets/images/default_image.jpg';
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: widget.isNetworkImage
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
              displayAge,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(width: 2),
            Text(
              displayColor,
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
            'Image unavailable',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}