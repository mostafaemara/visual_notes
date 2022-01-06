import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        width: double.infinity,
        child:
            ElevatedButton(onPressed: onPressed, child: const Text("Submit")));
  }
}
