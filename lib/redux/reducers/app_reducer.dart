

import 'package:squashy/redux/app_state.dart';
import 'package:squashy/redux/reducers/games_reducer.dart';
import 'package:squashy/redux/reducers/loading_reducer.dart';
import 'package:squashy/redux/reducers/navigation_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    games: gamesReducer(state.games, action),
    route: navigationReducer(state.route, action)
  );
}
