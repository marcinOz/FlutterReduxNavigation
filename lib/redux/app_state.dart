import 'package:meta/meta.dart';
import 'package:squashy/app_routes.dart';
import 'package:squashy/model/Game.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Game> games;
  final List<String> route;

  AppState({
    this.isLoading = false,
    this.games = const [],
    this.route = const [AppRoutes.home],
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Game> games,
  }) =>
      AppState(
          isLoading: isLoading ?? this.isLoading,
          games: games ?? this.games,
          route: route ?? this.route
      );

  @override
  int get hashCode =>
      isLoading.hashCode ^ games.hashCode ^ route.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          games == other.games &&
          route == other.route;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, games: $games, route: $route}';
  }
}
