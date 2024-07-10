import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';
import 'models/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter PokeAPI Demo',
        home: PokemonListScreen(),
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.pokemonList.length,
            itemBuilder: (context, index) {
              Pokemon pokemon = provider.pokemonList[index];
              return Column(
                children: <Widget>[
                  SizedBox(height: 16), // Espacio superior
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Espacio entre el nombre y el sprite
                  Image.network(
                    pokemon.spriteUrl,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 36), // Espacio inferior
                  Divider(), // Línea divisoria opcional
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PokemonProvider>(context, listen: false).fetchPokemon();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
