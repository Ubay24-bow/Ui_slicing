import 'package:flutter/material.dart';
import 'package:ui_login/core/components/warna_color.dart';

class button extends StatelessWidget {
  const button({
    super.key,
    required this.label,
    this.buttonColor,
    this.onPressed,
  });

  final String label;
  final Color? buttonColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? WarnaColor.utama,
          ),
        ),
        child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
