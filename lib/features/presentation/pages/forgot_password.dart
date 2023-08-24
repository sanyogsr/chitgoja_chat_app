import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/widgets/container_button_widget.dart';
import 'package:chitgoja/features/presentation/widgets/header_widget.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
      _passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                HeaderWidget(title: "Forgot Password"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "hello vro this is my group chat app which is self hosted so many many cong to  you !!",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: _passwordController,
                  prefixIcon: Icons.email,
                  hintText: "Email",
                ),
                SizedBox(
                  height: 20,
                ),
                ContainerButtonWidget(title: 'Send password reset Email'),
                SizedBox(
                  height: 20,
                ),
                _rowTextWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Remember the account information?"),
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, PageConst.loginPage, (route) => false);
          },
          child: Text(
            "Login",
            style: TextStyle(
                color: greenColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
