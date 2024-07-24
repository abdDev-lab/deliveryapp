import 'package:flutter/material.dart';

class CostumTitleAuth extends StatelessWidget {
  final String title ; 
  final String body ; 
  const CostumTitleAuth({super.key, required this.title, required this.body});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        Container(
          height: 10,
        ),
        Text(
          body,
          style:  const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
