import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:squashy/commons/date_today_formatter.dart';
import 'package:squashy/features/home/avatars_stack.dart';
import 'package:squashy/localization.dart';
import 'package:squashy/model/Game.dart';

class GameListItem extends StatelessWidget {
  final Game game;

  const GameListItem(this.game, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Card(
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4.0),
                          right: Radius.elliptical(15.0, 25.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          DateFormat.Hm().format(game.date),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Text(
                        DateTodayFormatter(game.date).format(context),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${game.where}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Text(AppLocalizations.of(context).courtsList(game
                              .courts
                              .map((court) => '${court.number}')
                              .join(", ")))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: AvatarsStack(
                        game.players.map((player) => player.name).toList())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
