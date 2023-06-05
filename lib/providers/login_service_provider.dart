import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter/services/login_service.dart';

class LoginServiceProvider extends InheritedWidget {
  final LoginService loginService;

  //const LoginServiceProvider({super.key, required super.child});
  const LoginServiceProvider(this.loginService,
      {super.key, required Widget child})
      : super(child: child);

  static LoginServiceProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginServiceProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
