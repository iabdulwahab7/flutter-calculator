import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  final VoidCallback onPress;

  const CalculatorButton({Key? key,
    required this.title,
    this.btnColor = Colors.grey,
    required this.onPress
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: btnColor,
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
