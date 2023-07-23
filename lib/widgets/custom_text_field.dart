import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.onChanged, this.hintText, this.obscureText,this.inputType});

  Function(String)? onChanged;
  String? hintText;
  bool? obscureText = false;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:inputType ,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.black,
            )
          ),
          border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.grey,
            )
          ),
          ),
    );
  }
}
