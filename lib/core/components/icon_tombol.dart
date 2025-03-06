import 'package:flutter/material.dart';
import 'package:ui_login/core/data/warna_color.dart';

class IconTombol extends StatelessWidget {
  const IconTombol({super.key, required this.label, this.onPressed});

  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(WarnaColor.utama),
        ),
        child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
