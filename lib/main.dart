import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:squashy/app_routes.dart';
import 'package:squashy/features/home/home_page.dart';
import 'package:squashy/features/newgame/new_game.dart';
import 'package:squashy/features/stub_screen.dart';
import 'package:squashy/localization.dart';
import 'package:squashy/redux/app_state.dart';
import 'package:squashy/redux/navigation_middleware.dart';
import 'package:squashy/redux/reducers/app_reducer.dart';
import 'package:squashy/route_aware_widget.dart';

void main() => runApp(MyApp());

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState.loading(),
      middleware: createNavigationMiddleware());

  final theme = ThemeData(
    primaryColor: Colors.grey.shade900,
    primaryColorLight: Colors.grey.shade800,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade800,
//          textTheme: TextTheme(
//            body1: TextStyle(color: Colors.white),
//            display1: TextStyle(color: Colors.white),
//            title: TextStyle(color: Colors.white),
//          ),
    iconTheme: IconThemeData(color: Colors.white),
    accentColor: Colors.yellow[500],
  );

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MainRoute(HomePage(), settings: settings);
      case AppRoutes.addGame:
        return FabRoute(NewGame(), settings: settings);
      default:
        return MainRoute(StubScreen(), settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
        title: AppLocalizations.appTitle,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
        ],
        theme: theme,
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class FabRoute<T> extends MaterialPageRoute<T> {
  FabRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
