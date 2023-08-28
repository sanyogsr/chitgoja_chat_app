import 'package:chitgoja/features/presentation/widgets/container_button_widget.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CreateNewGroupPage extends StatefulWidget {
  const CreateNewGroupPage({Key? key}) : super(key: key);

  @override
  _CreateNewGroupPageState createState() => _CreateNewGroupPageState();
}

class _CreateNewGroupPageState extends State<CreateNewGroupPage> {
  TextEditingController _groupNameController = TextEditingController();
  TextEditingController _noofUsersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Group"),
      ),
      body: Container(
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
                "Add Griup Image",
                style: TextStyle(color: primaryColor),
              ),
              SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                  hintText: "group name",
                  prefixIcon: Icons.group_add,
                  controller: _groupNameController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  hintText: "numbers of users joiin group",
                  prefixIcon: Icons.list,
                  controller: _noofUsersController,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 30,
              ),
              Divider(
                indent: 100,
                endIndent: 100,
                thickness: 1,
                color: Colors.black.withOpacity(.3),
              ),
              SizedBox(
                height: 30,
              ),
              ContainerButtonWidget(title: "Create New Group")
            ],
          )),
    );
  }
}
