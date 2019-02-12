

import 'package:squashy/model/Game.dart';

class AddGameAction {
  final Game game;

  AddGameAction(this.game);

  @override
  String toString() {
    return 'AddGameAction{game: $game}';
  }
}

class NavigateReplaceAction {
  final String routeName;
  
  NavigateReplaceAction(this.routeName);

  @override
  String toString() {
    return 'MainMenuNavigateAction{routeName: $routeName}';
  }
}

class NavigatePushAction {
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() {
    return 'NavigatePushAction{routeName: $routeName}';
  }
}

class NavigatePopAction {

  @override
  String toString() {
    return 'NavigatePopAction';
  }
}
