import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  final String name;

  const MainView({super.key, required this.name});

  @override
  Widget build(BuildContext context) => Center(
    child: Text('Hello $name'),
  );
}
