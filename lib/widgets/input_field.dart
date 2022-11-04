import 'package:flutter/material.dart';

class CustomeInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? obScuretext;
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  const CustomeInput(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      required this.inputType,
      this.validator,
      this.obScuretext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        obscureText: obScuretext ?? false,
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.blue.shade600)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.orange.shade600))),
      ),
    );
  }
}
