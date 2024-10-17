import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../functions/get_image_url.dart';
import '../functions/parse_pokedex.dart';
import '../models/pokemon_model.dart';

class GetPage extends StatelessWidget {
  GetPage({super.key});
  final Dio dio = Dio();
  Future<Map<String, dynamic>> getRequest() async {
    final response = await dio.get('http://192.168.10.6:8000/pokedex/api/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getRequest(),
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
            List<Pokemon> pokedex = parsePokedex(data);
            return ListView.builder(
              itemCount: pokedex.length,
              itemBuilder: (context, index) {
                String imgPath = getImageUrl(pokedex.elementAt(index).type);
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Text(pokedex.elementAt(index).id),
                    title: Text(
                      pokedex.elementAt(index).name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(pokedex.elementAt(index).type),
                    trailing: Image.asset(imgPath, width: 40),
                  ),
                );
              },
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
