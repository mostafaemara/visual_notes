import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/ui/pages/home/home_page.dart';

import 'package:visual_notes/src/ui/pages/note_details/note_details_page.dart';
import 'package:visual_notes/src/ui/pages/splash/splash_page.dart';
import 'package:visual_notes/src/ui/styles/themes.dart';

import 'bloc/notes/notes_cubit.dart';
import 'ui/pages/note/note_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HomePage.routeName: (context) => const HomePage(),
          NotePage.routeName: (context) => const NotePage(),
          NoteDetailsPage.routeName: (context) => const NoteDetailsPage()
        },
      ),
    );
  }
}
