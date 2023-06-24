import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({super.key, this.iconText, this.onTap});

  String? iconText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: 60,
        width: 150,
        decoration: BoxDecoration(
color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            iconText!,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
