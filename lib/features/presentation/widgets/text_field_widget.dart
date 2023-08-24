// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chitgoja/features/presentation/widgets/theme/style.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData prefixIcon;
  TextEditingController controller;
  final TextInputType keyboardType;
  final String? hintText;
  final VoidCallback? onTap;

  TextFieldWidget({
    Key? key,
    required this.prefixIcon,
    required this.controller,
   required this.keyboardType,
    this.hintText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color747480.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: InkWell(
              onTap: onTap,
              child: Icon(prefixIcon)),
            hintText: "$hintText"),
      ),
    );
  }
}
