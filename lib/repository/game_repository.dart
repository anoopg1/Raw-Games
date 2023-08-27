import 'package:rawg_gaming_zone/repository/models/game.dart';
import 'package:rawg_gaming_zone/repository/models/genre.dart';
import 'package:rawg_gaming_zone/repository/models/result.dart';
import 'package:rawg_gaming_zone/repository/service/game_service.dart';

class GameRepository {
  const GameRepository({
    required this.service,
  });
  final GameService service;

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async =>
      service.getGamesByCategory(genreId);
}
