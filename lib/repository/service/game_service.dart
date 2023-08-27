import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rawg_gaming_zone/repository/models/game.dart';
import 'package:rawg_gaming_zone/repository/models/genre.dart';
import 'package:rawg_gaming_zone/repository/models/result.dart';
import 'package:rawg_gaming_zone/repository/models/result_error.dart';

class GameService {
  GameService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.rawg.io/api',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{
      'key': ('36a212e75cc94f15bd114d1d0030accf')
    };
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }

  Future<Game> getGames() async {
    final response = await _httpClient.get(
      getUrl(url: 'games'),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Game.fromJson(
          json.decode(response.body),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting games');
    }
  }

  Future<List<Genre>> getGenres() async {
    final response = await _httpClient.get(
      getUrl(url: 'genres'),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return List<Genre>.from(
          json.decode(response.body)['results'].map(
                (data) => Genre.fromJson(data),
              ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting genres');
    }
  }

  Future<List<Result>> getGamesByCategory(int genreId) async {
    final response = await _httpClient.get(
      getUrl(
        url: 'games',
        extraParameters: {
          'genres': genreId.toString(),
        },
      ),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return List<Result>.from(
          json.decode(response.body)['results'].map(
                (data) => Result.fromJson(data),
              ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting games');
    }
  }
}
