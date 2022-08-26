import 'package:flutter/material.dart';
import 'package:pokemon_app/widgets/app_title.dart';
import 'package:pokemon_app/widgets/pokemon_list.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      ),
    );
  }
}
