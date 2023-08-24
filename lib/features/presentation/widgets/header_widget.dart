// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: 35, color: greenColor, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 1,
        )
      ],
    );
  }
}
