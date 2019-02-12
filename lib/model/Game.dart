import 'package:meta/meta.dart';
import 'package:squashy/model/Court.dart';
import 'package:squashy/model/Player.dart';

class Game {
  final String where;
  final DateTime date;
  final List<Court> courts;
  final List<Player> players;

  Game({@required this.where, @required this.date, this.players, this.courts});
}
