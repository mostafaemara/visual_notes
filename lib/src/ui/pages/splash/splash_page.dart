import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';
import 'package:visual_notes/src/ui/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    context.read<NotesCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      listener: (context, state) {
        if (!state.isLoading) {
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        }
      },
    );
  }
}
