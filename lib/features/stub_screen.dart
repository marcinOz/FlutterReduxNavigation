
import 'package:flutter/material.dart';
import 'package:squashy/features/menu/main_menu.dart';

class StubScreen extends StatelessWidget {

  Widget _getBody() => Center(
    child: Text('Stub Screen'),
  );

  @override
  Widget build(BuildContext context) {
    return MainMenu(_getBody());
  }

}
