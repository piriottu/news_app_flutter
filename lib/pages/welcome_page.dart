import 'package:flutter/material.dart';
import 'package:news_app_flutter/pages/second_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text('Welcome', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Center(
            child: Column(children: [
          Text(
            'Wolcome!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const SecondPage(name: 'Nicola!')));
            },
            child: const Text('avanti'),
          )
        ])),
      );
}
