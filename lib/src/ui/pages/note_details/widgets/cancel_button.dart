import 'package:flutter/material.dart';

class CancleButton extends StatelessWidget {
  const CancleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 100,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancle")));
  }
}
