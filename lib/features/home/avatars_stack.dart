import 'package:flutter/material.dart';

class AvatarsStack extends StatelessWidget {
  final List<String> names;

  AvatarsStack(this.names);

  @override
  Widget build(BuildContext context) {
    final avatars = List<Widget>();
    final max = names.length - 1 > 8 ? 8 : names.length - 1;
    for (num i = max; i >= 0; i--) {
      avatars.add(Positioned(
        right: (5.0 + (25 - i) * i),
        child: CircleAvatar(
          backgroundColor: (i % 2 == 0 ? Colors.yellow : Colors.grey),
          radius: 20,
          child: Text(names[i].substring(0, 1),
              style: TextStyle(fontSize: 30)),
        ),
      ));
    }

    return Container(
      height: 40,
      child: Stack(
        children: avatars,
      ),
    );
  }
}
