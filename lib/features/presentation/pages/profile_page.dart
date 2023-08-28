import 'package:chitgoja/features/presentation/widgets/container_button_widget.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              width: 60,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              child: Text(""),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Remove Profile Photo",
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(
              height: 40,
            ),
            TextFieldWidget(
                hintText: "name",
                prefixIcon: Icons.person,
                controller: _nameController,
                keyboardType: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                hintText: "email",
                prefixIcon: Icons.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                hintText: "status",
                prefixIcon: Zocial.statusnet,
                controller: _descriptionController,
                keyboardType: TextInputType.text),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(.3),
            ),
            SizedBox(
              height: 40,
            ),
            ContainerButtonWidget(title: "Update")
          ],
        ));
  }
}
