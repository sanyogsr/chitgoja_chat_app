import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/widgets/container_button_widget.dart';
import 'package:chitgoja/features/presentation/widgets/header_widget.dart';
import 'package:chitgoja/features/presentation/widgets/password_text_field.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Column(
            children: [
              HeaderWidget(title: "Login"),
              TextFieldWidget(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                prefixIcon: Icons.email,
                hintText: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              PasswordTextFiield(
                controller: _passwordController,
                prefixIcon: Icons.lock,
                suffixIcon: MaterialIcons.remove_red_eye,
              ),
              SizedBox(
                height: 20,
              ),
              _forgotPasswordWidget(),
              SizedBox(
                height: 10,
              ),
              ContainerButtonWidget(
                title: "Login",
                onTap: () {
                  print("i'm ready");
                },
              ),
              SizedBox(
                height: 15,
              ),
              _rowTextWidget(),
              SizedBox(
                height: 20,
              ),
              _rowGoogleWidget()
            ],
          ),
        )),
      ),
    );
  }

  Widget _rowGoogleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            //will make google auth....!
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            child: Icon(
              AntDesign.google,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _rowTextWidget() {
    return Row(
      children: [
        Text("Don't have an account?"),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageConst.registerPage);
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: greenColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Widget _forgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(' '),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageConst.forgotPasswordPage);
          },
          child: Text(
            'Frogot Password?',
            style: TextStyle(
                color: greenColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
