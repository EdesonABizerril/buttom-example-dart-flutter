import 'package:flutter/material.dart';

import '../atoms/dash_app_bar.dart';
import '../organisms/container_buttons.dart';

class SecondTemplate extends StatelessWidget {
  const SecondTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar.leadAndAction(
          title: 'Second Page',
          backgroundColor: Colors.red,
          onTap: Navigator.of(context).pop,
          action: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: const [
              ContainerButtons(
                title: 'Where does it come from?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
