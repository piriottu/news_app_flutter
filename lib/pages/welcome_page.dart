import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text('Welcome', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Center(
            child: Text(
          'Wolcome!',
          style: Theme.of(context).textTheme.headlineMedium,
        )),
      );
}
