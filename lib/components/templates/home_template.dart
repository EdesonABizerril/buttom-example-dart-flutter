import 'package:flutter/material.dart';

import '../../screens/second_screen.dart';
import '../atoms/dash_app_bar.dart';
import '../atoms/dash_button.dart';
import '../organisms/container_buttons.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar.single(
        title: 'Home Page',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "What is Lorem Ipsum?",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 15),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
            const ContainerButtons(title: "Why do we use it?"),
            DashButton.primary(
              width: MediaQuery.of(context).size.width,
              icon: Icons.route,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ));
              },
              label: "Ir para segunda tela".toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
