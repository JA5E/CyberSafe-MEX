import 'package:flutter/material.dart';

class MyButtonBuilder {
  static ElevatedButton buildElevatedButton(
    String buttonText, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4548E6),
        minimumSize: const Size(0, 60),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Center(
            child: Align(
              alignment: const Alignment(0, 0),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}