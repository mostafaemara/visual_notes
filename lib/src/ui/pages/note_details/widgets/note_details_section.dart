import 'package:flutter/material.dart';

class NoteDetailsSection extends StatelessWidget {
  const NoteDetailsSection({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            body,
            style: Theme.of(context).textTheme.subtitle2!,
          ),
        ],
      ),
    );
  }
}
