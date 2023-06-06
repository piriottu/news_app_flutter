import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Second page')),
        body: Center(
          child: Column(
            children: [
              Text('Hello $name'),
              Container(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('indietro'),
              )
            ],
          ),
        ),
      );
}
