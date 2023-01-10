import 'package:flutter/material.dart';

import '../molecules/buttons_direction.dart';

class ContainerButtons extends StatelessWidget {
  const ContainerButtons({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const ButtonsDirection(),
        ],
      ),
    );
  }
}
