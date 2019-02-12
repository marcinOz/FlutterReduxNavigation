import 'package:redux/redux.dart';
import 'package:squashy/redux/actions.dart';

final navigationReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, NavigateReplaceAction>(_navigateReplace),
  TypedReducer<List<String>, NavigatePushAction>(_navigatePush),
  TypedReducer<List<String>, NavigatePopAction>(_navigatePop),
]);

List<String> _navigateReplace(
    List<String> route, NavigateReplaceAction action) =>
    [action.routeName];

List<String> _navigatePush(List<String> route, NavigatePushAction action) {
  var result = List<String>.from(route);
  result.add(action.routeName);
  return result;
}

List<String> _navigatePop(List<String> route, NavigatePopAction action) {
  var result = List<String>.from(route);
  result.removeLast();
  return result;
}
