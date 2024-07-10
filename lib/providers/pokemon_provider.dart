import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/api_service.dart';

class PokemonProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemon() async {
    _isLoading = true;
    notifyListeners();

    try {
      _pokemonList = await _apiService.fetchPokemonList();

      for (var pokemon in _pokemonList) {
        final spriteUrl = await _apiService
            .fetchPokemonSpriteById(getPokemonIdFromUrl(pokemon.url));
        pokemon.spriteUrl = spriteUrl;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Failed to fetch Pokémon: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método para extraer el ID del Pokémon desde la URL
  int getPokemonIdFromUrl(String url) {
    final regex = RegExp(r'/(\d+)/$');
    final match = regex.firstMatch(url);
    if (match != null) {
      return int.parse(match.group(1)!);
    }
    throw Exception('Invalid Pokémon URL');
  }
}
