import 'package:flutter/material.dart';

import '../../dash_button.dart';

class ButtonsDirection extends StatelessWidget {
  const ButtonsDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        DashButton.primary(
          width: 200,
          onPressed: () {},
          label: "Example Primary",
        ),
        const SizedBox(height: 20),
        DashButton.secondary(
          width: 250,
          onPressed: () {},
          label: "Example Secondary",
        ),
        const SizedBox(height: 20),
        DashButton.tertiary(
          width: 200,
          onPressed: () {},
          label: "Example Tertiary",
        ),
      ],
    );
  }
}
