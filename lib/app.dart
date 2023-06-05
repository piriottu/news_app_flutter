import 'package:flutter/material.dart';
import 'package:news_app_flutter/pages/login_page.dart';
import 'package:news_app_flutter/providers/login_service_provider.dart';
import 'package:news_app_flutter/services/login_service.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginServiceProvider(
      LoginService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
