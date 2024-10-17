import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../functions/get_image_url.dart';
import '../functions/parse_pokemon.dart';
import '../models/pokemon_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> postRequest(String number) async {
    final response = await dio.post('http://192.168.10.6:8000/pokedex/api/',
        data: {'number': number},
        options: Options(headers: {'Content-Type': 'application/json'}));
    return response.data;
  }

  final TextEditingController field = TextEditingController();

  String pokemonNumber = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: postRequest(pokemonNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            Pokemon pokemon = parsePokemon(data['pokemon'], pokemonNumber);
            String imgPath = getImageUrl(pokemon.type);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  pokemon.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Spacer(),
                SizedBox(
                  height: 200,
                  child: Image.asset(imgPath),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    pokemonNumber = (Random().nextInt(151) + 1).toString();
                    await postRequest(pokemonNumber);
                    setState(() {});
                  },
                  child: const Text('Random Pokemon'),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: field,
                    decoration: InputDecoration(
                      hintText: "Enter a Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    pokemonNumber =
                        field.text.isEmpty ? '1' : field.text.toString();
                    await postRequest(pokemonNumber);
                    setState(() {});
                  },
                  child: const Text('Search Pokemon'),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}
