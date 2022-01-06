import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/ui/pages/edite_note/edite_note_page.dart';
import 'package:visual_notes/src/ui/pages/home/home_page.dart';
import 'package:visual_notes/src/ui/pages/new_note/new_note_page.dart';
import 'package:visual_notes/src/ui/styles/themes.dart';

import 'bloc/notes/notes_cubit.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..init(),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          NewNotePage.routeName: (context) => const NewNotePage(),
          EditeNotePage.routeName: (context) => const EditeNotePage()
        },
      ),
    );
  }
}
