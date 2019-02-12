import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:squashy/app_routes.dart';
import 'package:squashy/features/menu/bottom_nav_bar.dart';
import 'package:squashy/redux/actions.dart';
import 'package:squashy/redux/app_state.dart';

class MainMenu extends StatelessWidget {
  final Widget body;

  MainMenu(this.body);

  Widget _getInfoBarWorkaround() =>
      PreferredSize(child: Container(), preferredSize: Size(0.0, 0.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getInfoBarWorkaround(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => StoreProvider.of<AppState>(context)
            .dispatch(NavigatePushAction(AppRoutes.addGame)),
        tooltip: 'Add new game',
        child: Icon(Icons.add),
      ),
      body: body,
    );
  }
}
