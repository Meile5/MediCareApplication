import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget{
  final String label;

  final VoidCallback? onPressed;

  final bool isLoading;

  const LoginButton({
    super.key, required this.label, required this.onPressed, this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: (isLoading) ? null : onPressed,

      child: isLoading ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      ) : Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),

    );
  }

}