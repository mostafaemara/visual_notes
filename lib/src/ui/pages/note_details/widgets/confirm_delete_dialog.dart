import 'package:flutter/material.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: const Text("Delete this note?"),
      title: Text(
        "Delete",
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      actions: [
        SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Delete",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error)))),
        SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancle"))),
      ],
    )
        //actions: [ElevatedButton(onPressed: () {}, child: Text("ok"))],
        ;
  }
}
