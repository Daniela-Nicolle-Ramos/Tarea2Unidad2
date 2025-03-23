import 'package:flutter/material.dart';
import 'package:harry_potter_app/src/api.dart';
import 'package:harry_potter_app/src/models.dart';
import 'package:harry_potter_app/src/character_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharactersListScreen extends StatefulWidget {
  @override
  _CharactersListScreenState createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  late Future<List<CharactersHp>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _charactersFuture = HarryPotterApiService().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Personajes'),
      ),
      body: FutureBuilder<List<CharactersHp>>(
        future: _charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: character.image, // URL de la imagen
                    placeholder: (context, url) =>
                        CircularProgressIndicator(), // Indicador de carga
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/no_image-min'), // Imagen de error
                  ),
                  title: Text(character.name),
                  subtitle: Text(character.house.name.isEmpty
                      ? 'Unknown House'
                      : character.house.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CharacterDetailScreen(character: character),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No characters found.'));
          }
        },
      ),
    );
  }
}
