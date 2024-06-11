import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  const RowData({
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(title, style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}
