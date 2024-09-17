import 'package:flutter/material.dart';
import 'package:pruyeba_tecnica_pragma/domain/entities/cat_breed.dart';

class CatBreedDetailPage extends StatelessWidget {
  final CatBreed breed;

  const CatBreedDetailPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          Image.network(
            'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/sin_imagen.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
          Expanded(
            child: Scrollbar(
              thickness: 12.0,
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${breed.description}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Origen: ${breed.origin}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Inteligencia: ${breed.intelligence}/5',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Adaptabilidad: ${breed.adaptability}/5',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tiempo de vida: ${breed.lifeSpan} años',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
