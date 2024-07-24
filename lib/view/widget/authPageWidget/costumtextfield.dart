import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';

class CostumeTextField extends StatelessWidget {
  final String hinttext;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final void Function()? onIcon;
  final bool isNumber;
  final bool? obscureText;
  const CostumeTextField({
    super.key,
    required this.hinttext,
    required this.iconData,
    required this.controller,
    required this.validator,
    required this.isNumber,
    this.obscureText,
    this.onIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: const Color.fromARGB(255, 234, 234, 234).withOpacity(0.5),
            offset: const Offset(0,-10))
      ]),
      width: 325,
      height: 85,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: validator,
        
        decoration: InputDecoration(
          
            hintText: hinttext,
            hintStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
            prefixIcon: IconButton(
              color: AppColor.mainColor,
              icon: Icon(iconData , color: AppColor.mainColor,),
              iconSize: 23,
              onPressed: onIcon,
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle:
                const TextStyle(fontSize: 13, color: Colors.red, height: 1),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 94, 94, 94))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 18)),
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 16 , color: Colors.black),
      ),
    );
  }
}
