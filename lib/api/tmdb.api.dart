import 'dart:convert';

import 'package:http/http.dart';
import 'package:clase_03/models/result.model.dart';

class TmbdApi {

  final Client _client = Client();
  final String _apiKey = '44cd50d100ebb392e1a12b01c68ace98';

  Future<Result> getPopulars() async{

    final Response response = await _client.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=es-ES&page=1'
    );

    return response.statusCode == 200 
      ? Result.fromJson(json.decode(response.body))
      : throw Exception('Error on Populars API');
  }

}