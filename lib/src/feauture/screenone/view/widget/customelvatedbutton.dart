import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal), // لون الزر
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12), // تباعد داخلي
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold), // نص الزر
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
