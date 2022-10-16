import 'package:flutter/material.dart';
import 'package:time/time.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onPressed,
    this.text,
  });

  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 300.milliseconds,
      opacity: onPressed != null ? 1 : 0.5,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 15,
          ),
          backgroundColor: const Color(0xFF4971FF),
        ),
        child: Text(
          text ?? 'Dalej',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
