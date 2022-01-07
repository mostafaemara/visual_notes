import 'package:flutter/material.dart';
import 'package:visual_notes/src/ui/styles/app_colors.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            color: AppColors.light20,
          ),
          const SizedBox(
            height: 30,
          ),
          FittedBox(
            child: Text(
              "Notes is empty add some!",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: AppColors.light20,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
