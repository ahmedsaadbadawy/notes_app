import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonName,
    this.buttonColor,
    this.isLoading = false,
  });

  final VoidCallback? onTap;
  final String? buttonName;
  final Color? buttonColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(buttonName!, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
