import 'package:flutter/material.dart';

class AnwserButton extends StatelessWidget {
  final String anwserText;
  final void Function() onTap;

  const AnwserButton({
    super.key,
    required this.anwserText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(50, 63, 81, 181),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
      ),
      child: Text(anwserText, textAlign: TextAlign.center),
    );
  }
}
