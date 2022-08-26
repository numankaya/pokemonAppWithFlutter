import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/widgets/pokelist_item.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) =>
                  PokeListItem(pokemon: _listem[index]));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata çıktı"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
