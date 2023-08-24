// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';

class RowTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? ontap;

  const RowTextWidget({
    Key? key,
    required this.text1,
    required this.text2,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$text1"),
        InkWell(
          onTap: ontap,
          child: Text(
            '$text2',
            style: TextStyle(
                color: greenColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
