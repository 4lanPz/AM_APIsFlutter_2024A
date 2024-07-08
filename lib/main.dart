import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/gato_provider.dart';
import '../models/gato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GatoProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Gato API Demo',
        home: GatoListScreen(),
      ),
    );
  }
}

class GatoListScreen extends StatelessWidget {
  const GatoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gato List'),
      ),
      body: Consumer<GatoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.gatoList.length,
            itemBuilder: (context, index) {
              Gato gato = provider.gatoList[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(gato.imageUrl),
                  Container(
                    color: Colors.black54,
                    child: Text(
                      gato.statusCode.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<GatoProvider>(context, listen: false).fetchgato();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/pokemon_provider.dart';
// import 'models/pokemon.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => PokemonProvider()),
//       ],
//       child: const MaterialApp(
//         title: 'Flutter PokeAPI Demo',
//         home: PokemonListScreen(),
//       ),
//     );
//   }
// }

// class PokemonListScreen extends StatelessWidget {
//   const PokemonListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pokémon List'),
//       ),
//       body: Consumer<PokemonProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             itemCount: provider.pokemonList.length,
//             itemBuilder: (context, index) {
//               Pokemon pokemon = provider.pokemonList[index];
//               return ListTile(
//                 title: Text(pokemon.name),
//                 onTap: () {
//                   // Puedes agregar una navegación a un detalle de Pokémon aquí
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Provider.of<PokemonProvider>(context, listen: false).fetchPokemon();
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
