import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/src/bloc/note/note_cubit.dart';

import 'package:visual_notes/src/ui/widgets/error_dialog.dart';
import 'package:visual_notes/src/ui/widgets/loading_dialog.dart';
import "../../../../helpers/datetime_helper.dart";
import 'package:visual_notes/src/bloc/submission_state.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';
import 'package:visual_notes/src/data/models/note_status.dart';

import 'package:visual_notes/src/validators/note_validators.dart';

import 'date_form_field.dart';
import 'image_form_field.dart';
import 'status_form_field.dart';
import 'submit_button.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({Key? key, this.note}) : super(key: key);
  final Note? note;

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  NoteStatus? _selectedStatus;
  String? _selectedImage;

  final spacer = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteCubit, SubmissionState<String>>(
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                validator: titleValidator,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              spacer,
              TextFormField(
                controller: _descriptionController,
                validator: descriptionValidator,
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
              ),
              spacer,
              DateFormField(
                controller: _dateController,
              ),
              spacer,
              StatusFormField(
                onChanged: _handleStatusChange,
                selectedStatus: _selectedStatus,
              ),
              spacer,
              ImageFormField(
                onChanged: _selectImage,
                selectedImage: _selectedImage,
              ),
              const SizedBox(
                height: 80,
              ),
              SubmitButton(
                onPressed: _handleSubmission,
              )
            ],
          )),
      listener: (context, state) {
        state.whenOrNull(
          submitting: _showLoadingDialog,
          failed: _showErrorDialog,
          success: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) => const LoadingDialog(),
    );
  }

  void _showErrorDialog(String message) {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
              title: "An error occurred",
              body: message,
            ));
  }

  @override
  void didChangeDependencies() {
    _init();
    super.didChangeDependencies();
  }

  void _init() {
    if (widget.note != null) {
      _initFieldsWithNoteValue();
    } else {
      _initEmptyFields();
    }
  }

  void _initFieldsWithNoteValue() {
    final noteData = widget.note!.data;
    _dateController =
        TextEditingController(text: noteData.date.formatToString());
    _titleController = TextEditingController(text: noteData.title);
    _descriptionController = TextEditingController(text: noteData.description);
    _selectedImage = noteData.picture;
    _selectedStatus = noteData.status;
  }

  void _initEmptyFields() {
    _dateController = TextEditingController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  void _handleStatusChange(NoteStatus? status) {
    if (status != null) {
      setState(() {
        _selectedStatus = status;
      });
    }
  }

  void _selectImage(String? image) {
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _handleSubmission() {
    _notifyUserNoneSelectedFields();
    if (_formIsValid()) {
      if (widget.note != null) {
        _editeNote();
      } else {
        _addNewNote();
      }
    }
  }

  _notifyUserNoneSelectedFields() {
    if (_selectedImage == null) {
      _showWarningToast("image required, please capture one");
    }
    if (_selectedStatus == null) {
      _showWarningToast("Status required, please select Status");
    }
  }

  void _showWarningToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool _formIsValid() {
    final formIsValid = _formKey.currentState!.validate();

    return formIsValid && _selectedStatus != null && _selectedImage != null;
  }

  void _editeNote() {
    final noteDate = NoteData(
        title: _titleController.text,
        picture: _selectedImage!,
        description: _descriptionController.text,
        date: DateFormat.yMd().parse(_dateController.text),
        status: _selectedStatus!);
    final note = Note(data: noteDate, id: widget.note!.id);
    context.read<NoteCubit>().updateNote(note);
  }

  void _addNewNote() {
    final noteDate = NoteData(
        title: _titleController.text,
        picture: _selectedImage!,
        description: _descriptionController.text,
        date: DateFormat("yyyy-MM-dd HH:mm").parse(_dateController.text),
        status: _selectedStatus!);
    context.read<NoteCubit>().addNote(noteDate);
  }
}
