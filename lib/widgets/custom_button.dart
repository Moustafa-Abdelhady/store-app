import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,this.onTap,required this.text});

  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        width:double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color:Colors.blue.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
          child: Center(
            child: Text(text,style: TextStyle(fontSize: 16),),
          ),
      )
    );
  }
}
