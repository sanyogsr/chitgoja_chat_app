import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/pages/forgot_password.dart';
import 'package:chitgoja/features/presentation/pages/login_page.dart';
import 'package:chitgoja/features/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        {
          return materialBuilder(widget: LoginPage());
        }
      case PageConst.forgotPasswordPage:
        {
          return materialBuilder(widget: ForgotPassword());
        }
      case PageConst.loginPage:
        {
          return materialBuilder(widget: LoginPage());
        }
      case PageConst.registerPage:
        {
          return materialBuilder(widget: RegisterPage());
        }

      default:
        return materialBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Page'),
      ),
      body: Center(
        child: Text('Erroe Page'),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
