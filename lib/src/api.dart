import 'package:http/http.dart' as http;
import 'package:harry_potter_app/src/models.dart';

class HarryPotterApiService {
  static const String _baseUrl =
      'https://potterhead-api.vercel.app/api/characters';

  Future<List<CharactersHp>> fetchCharacters() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return charactersHpFromJson(response.body);
    } else {
      throw Exception('Personaje no encontrado');
    }
  }
}
