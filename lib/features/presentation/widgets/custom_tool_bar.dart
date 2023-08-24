import 'dart:ffi';

import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

typedef ToolBarController = Function(int index);

class CustomToolBar extends StatelessWidget {
  final ToolBarController toolBarIndexController;
  final int? pageIndex;
  const CustomToolBar(
      {Key? key, required this.toolBarIndexController, this.pageIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: primaryColor),
      child: Row(
        children: [
          Expanded(
              child: ToolBarItem(
            borderWidth: 3,
            textColor: pageIndex == 0 ? Colors.white : Colors.black,
            borderColor: pageIndex == 0 ? Colors.white : Colors.transparent,
            title: "Groups",
            onTap: () {
              toolBarIndexController(0);
            },
          )),
          Expanded(
              child: ToolBarItem(
            borderWidth: 3,
            textColor: pageIndex == 1 ? Colors.white : Colors.black,
            borderColor: pageIndex == 1 ? Colors.white : Colors.transparent,
            title: "Users",
            onTap: () {
              toolBarIndexController(1);
            },
          )),
          Expanded(
              child: ToolBarItem(
            borderWidth: 3,
            textColor: pageIndex == 2 ? Colors.white : Colors.black,
            borderColor: pageIndex == 2 ? Colors.white : Colors.transparent,
            title: "Profile",
            onTap: () {
              toolBarIndexController(2);
            },
          )),
        ],
      ),
    );
  }
}

class ToolBarItem extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback? onTap;

  ToolBarItem(
      {Key? key,
      required this.borderWidth,
      required this.borderColor,
      this.onTap,
      this.textColor,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: borderColor, width: borderWidth))),
      child: InkWell(
        onTap: onTap,
        child: Text(
          '$title',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}
