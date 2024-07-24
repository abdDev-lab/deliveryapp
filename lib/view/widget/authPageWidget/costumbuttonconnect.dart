import 'package:flutter/material.dart';

class CostumButtonConnect extends StatelessWidget {
  final String image;
  const CostumButtonConnect({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 217, 217, 217).withOpacity(0.5),
              spreadRadius: 2,

              blurRadius: 8,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: MaterialButton(
          onPressed: () {},
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    );
  }
}
