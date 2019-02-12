import 'package:redux/redux.dart';
import 'package:squashy/model/Game.dart';
import 'package:squashy/redux/actions.dart';

final gamesReducer = combineReducers<List<Game>>([
  TypedReducer<List<Game>, AddGameAction>(_addGame),
]);

List<Game> _addGame(List<Game> games, AddGameAction action) {
  return List.from(games)..add(action.game);
}
