import '../../core/pokemon_constants.dart';

class Pokemon {
  final String name;
  final String? image;

  Pokemon({required this.name, required this.image,});

  factory Pokemon.fromJson(json) {
    final url = json['url'].toString().split('/')
      ..removeWhere((element) => element == '');
    final id = url.last;
    final image = '${PokemonConstants.pokemonImageBaseUrl}/$id.png';
    return Pokemon(
      name: json['name'],
      image: image,
    );
  }
}

List<Pokemon> adaptJsonToPokemons(json) => List<Pokemon>.from(json.map((x) => Pokemon.fromJson(x)));