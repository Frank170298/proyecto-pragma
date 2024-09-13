import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pruyeba_tecnica_pragma/domain/entities/cat_breed.dart';
import 'package:pruyeba_tecnica_pragma/domain/repositories/cat_breed_repository.dart';
import '../models/cat_breed_model.dart';

class CatApiService implements CatBreedRepository {
  final String apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  @override
  Future<List<CatBreed>> getCatBreeds() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => CatBreedModel.fromJson(json).toEntity())
          .toList();
    } else {
      throw Exception('Error al cargar las razas');
    }
  }
}
