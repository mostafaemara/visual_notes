import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({Key? key, required this.visualNote}) : super(key: key);
  final Note visualNote;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      height: 90,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            height: 60,
            width: 60,
            child: Image.network(
              "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQ3mAsYa-38yGG5uSf4cB4M-tHh5jcxTdRgNIAyfuuiSJscyEEy9kK4xK4u0MkP9bKObinJ4PBIU644P6590pA",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text("Description",
                    style: Theme.of(context).textTheme.caption!),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "12:00:pm",
                  style: Theme.of(context).textTheme.caption!,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
