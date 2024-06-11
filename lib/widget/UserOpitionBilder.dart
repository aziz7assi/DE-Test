import 'package:detest/color/Tcolor.dart';
import 'package:flutter/material.dart';

class UserOpitionBilder extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  const UserOpitionBilder({
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: TColors.bla.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.displayMedium),
              Icon(
                Icons.arrow_forward,
                color: TColors.primary,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
