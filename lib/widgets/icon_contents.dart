import 'package:flutter/material.dart';

import '../Constants/constants.dart';


class Gender extends StatelessWidget {
  const Gender({required this.icon, required this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: KTextStyle,
        )
      ],
    );
  }
}
