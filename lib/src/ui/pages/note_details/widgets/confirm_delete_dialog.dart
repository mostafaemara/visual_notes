import 'package:flutter/material.dart';

import 'cancel_button.dart';
import 'confirm_delete_button.dart';

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
      actions: const [
        ConfirmDeleteButton(),
        CancleButton(),
      ],
    )
        //actions: [ElevatedButton(onPressed: () {}, child: Text("ok"))],
        ;
  }
}
