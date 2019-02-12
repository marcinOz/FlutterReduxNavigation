import 'package:flutter/material.dart';

class NewGame extends StatelessWidget {
  Widget _getBody(BuildContext context) => Center(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('New Game', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            RaisedButton(
              child: Text('Show Alert'),
                onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      title: Text('Alert Title'),
                      content: Text('Content of alert.')));
            })
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Game')),
      body: _getBody(context),
    );
  }
}
