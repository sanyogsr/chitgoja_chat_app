import 'package:flutter/material.dart';

import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PasswordTextFiield extends StatefulWidget {
  final IconData prefixIcon;
  TextEditingController controller;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;

  PasswordTextFiield({
    Key? key,
    required this.prefixIcon,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<PasswordTextFiield> createState() => _PasswordTextFiieldState();
}

class _PasswordTextFiieldState extends State<PasswordTextFiield> {
  bool isObsecure = true;

  var hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color747480.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        obscureText: isObsecure,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            hintText: "$hintText",
            border: InputBorder.none,
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                child: Icon(isObsecure == true
                    ? MaterialIcons.remove_red_eye
                    : MaterialIcons.panorama_fish_eye))),
      ),
    );
  }
}
