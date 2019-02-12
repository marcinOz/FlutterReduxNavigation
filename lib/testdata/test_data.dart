import 'dart:math';

import 'package:squashy/model/Court.dart';
import 'package:squashy/model/Game.dart';
import 'package:squashy/model/Player.dart';

class TestData {
  static final _courts = [
    Court(number: 1, wasReserved: Random().nextBool()),
    Court(number: 2, wasReserved: Random().nextBool()),
    Court(number: 3, wasReserved: Random().nextBool()),
    Court(number: 4, wasReserved: Random().nextBool()),
    Court(number: 5, wasReserved: Random().nextBool()),
  ];

  static final _players = [
    Player('Marcin'),
    Player('Kuba'),
    Player('Piotr'),
    Player('Bartek'),
    Player('Krzysztof'),
    Player('Łukasz'),
    Player('Denis'),
    Player('Leszek')
  ];

  static final _games = [
    Game(
        where: 'Hedonia',
        date: DateTime.now().subtract(Duration(days: 1)),
        players: getRandomPlayers(3),
        courts: getRandomCourts(1)),
    Game(
        where: 'Hedonia',
        date: DateTime.now(),
        players: getRandomPlayers(2),
        courts: getRandomCourts(1)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 1)),
        players: getRandomPlayers(3),
        courts: getRandomCourts(1)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 2)),
        players: getRandomPlayers(4),
        courts: getRandomCourts(2)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 3)),
        players: getRandomPlayers(40),
        courts: getRandomCourts(2)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 5)),
        players: getRandomPlayers(6),
        courts: getRandomCourts(2)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 8)),
        players: getRandomPlayers(7),
        courts: getRandomCourts(3)),
    Game(
        where: 'Hedonia',
        date: DateTime.now().add(Duration(days: 13)),
        players: getRandomPlayers(5),
        courts: getRandomCourts(3))
  ];

  static List<Game> getRandomGames(num size) => _getRandomList(size, _games);

  static List<Player> getRandomPlayers(num size) =>
      _getRandomList(size, _players);

  static List<Court> getRandomCourts(num size) => _getRandomList(size, _courts);

  static List<T> _getRandomList<T>(num size, List<T> list) {
    final random = Random();
    List<T> result = [];
    for (var i = 0; i < size; i++) {
      result.add(list[random.nextInt(list.length)]);
    }
    return result;
  }
}
