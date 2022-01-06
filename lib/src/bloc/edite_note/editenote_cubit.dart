import 'package:bloc/bloc.dart';

import 'package:visual_notes/src/bloc/submission_state.dart';
import 'package:visual_notes/src/data/models/note.dart';

class EditenoteCubit extends Cubit<SubmissionState> {
  EditenoteCubit() : super(const SubmissionState.idle());
}
