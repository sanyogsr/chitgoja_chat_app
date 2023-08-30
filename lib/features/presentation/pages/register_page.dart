import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/widgets/container_button_widget.dart';
import 'package:chitgoja/features/presentation/widgets/header_widget.dart';
// import 'package:chitgoja/features/presentation/widgets/password_text_field.dart';
import 'package:chitgoja/features/presentation/widgets/row_text_widget.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
// import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  bool _isShowPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  Widget _rowDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "By clicking the Register, you agree to the ",
          style: TextStyle(fontSize: 12, color: colorC1C1C1),
        ),
        Text(
          'Privacy Policy',
          style: TextStyle(
              color: greenColor, fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  _bodyWidget() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderWidget(title: "Register"),
            SizedBox(
              height: 20,
            ),
            _profileWidget(),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              keyboardType: TextInputType.text,
              controller: _nameController,
              prefixIcon: Icons.person,
              hintText: "Name",
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              prefixIcon: Icons.email,
              hintText: "Email",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 120,
              child: Divider(
                thickness: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color747480.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                obscureText: _isShowPassword,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _isShowPassword = !_isShowPassword;
                          });
                        },
                        child: Icon(_isShowPassword == true
                            ? MaterialIcons.remove_red_eye
                            : MaterialIcons.panorama_fish_eye))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color747480.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                obscureText: _isShowPassword,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isShowPassword =
                                _isShowPassword == false ? true : false;
                          });
                        },
                        child: Icon(_isShowPassword == true
                            ? MaterialIcons.remove_red_eye
                            : MaterialIcons.panorama_fish_eye))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              keyboardType: TextInputType.datetime,
              controller: _dobController,
              prefixIcon: Icons.date_range,
              hintText: "Date of Birth",
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              keyboardType: TextInputType.text,
              controller: _genderController,
              prefixIcon: Icons.male_outlined,
              hintText: "Gender",
            ),
            SizedBox(
              height: 20,
            ),
            ContainerButtonWidget(title: "Register"),
            SizedBox(
              height: 10,
            ),
            RowTextWidget(
              ontap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, PageConst.loginPage, (route) => false);
              },
              text1: 'Do you alreadyy have account? ',
              text2: 'Login',
            ),
            SizedBox(
              height: 10,
            ),
            _rowDataWidget()
          ],
        ),
      ),
    ));
  }

  Widget _profileWidget() {
    return Column(children: [
      Container(
        height: 62,
        width: 62,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        child: Image.asset('assets/profile_default.png'),
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () {
          //image picker comes here
        },
        child: Text('Add a Photo'),
      )
    ]);
  }
}
