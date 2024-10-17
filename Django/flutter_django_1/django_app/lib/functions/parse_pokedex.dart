import '../models/pokemon_model.dart';

List<Pokemon> parsePokedex(Map<String, dynamic> pokedexJson) {
  List<Pokemon> pokemons = [];
  pokedexJson.forEach((key, value) {
    pokemons.add(Pokemon.fromJson({
      'id': key,
      'name': value['name'],
      'type': value['type'],
    }));
  });
  return pokemons;
}
