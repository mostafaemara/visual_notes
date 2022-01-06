import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/ui/pages/note_details/note_details_page.dart';
import "../../../../helpers/note_status_helper.dart";
import "../../../../helpers/image_helper.dart";
import "../../../../helpers/datetime_helper.dart";

class NoteListItem extends StatelessWidget {
  const NoteListItem({Key? key, required this.note}) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          NoteDetailsPage.routeName,
          arguments: note,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        height: 90,
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  note.data.picture.base64ToImage(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        note.data.title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        note.data.description,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    note.data.status.mapToString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    note.data.date.formatToString(),
                    style: Theme.of(context).textTheme.caption!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
