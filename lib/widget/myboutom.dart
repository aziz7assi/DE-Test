import 'package:detest/color/Tcolor.dart';
import 'package:flutter/material.dart';

class My_button extends StatelessWidget {
  final Color color;
  final String title;
  final Color Titlecolor;
  final VoidCallback onpressed;

  const My_button(
      {required this.color,
      required this.title,
      required this.onpressed,
      required this.Titlecolor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: TColors.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Titlecolor,
              fontSize: 24,
              fontFamily: 'AlBold',
            ),
          ),
        ),
      ),
    );
  }
}
