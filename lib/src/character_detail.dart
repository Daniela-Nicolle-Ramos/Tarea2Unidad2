import 'package:flutter/material.dart';
import 'package:harry_potter_app/src/models.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharactersHp character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: character.image.isNotEmpty
                  ? Image.network(character.image, height: 200)
                  : Image.asset('assets/no_image-min.jpg', height: 200),
            ),
            SizedBox(height: 16.0),
            Text('Name: ${character.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(
                'House: ${character.house.name.isEmpty ? 'Unknown' : character.house.name}'),
            Text('Species: ${character.species.name}'),
            Text(
                'Ancestry: ${character.ancestry.name.isEmpty ? 'Unknown' : character.ancestry.name}'),
            Text('Actor: ${character.actor}'),
            Text('Alive: ${character.alive ? 'Yes' : 'No'}'),
            // Agrega más detalles según sea necesario
          ],
        ),
      ),
    );
  }
}
