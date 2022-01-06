import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visual_notes/src/data/models/note_status.dart';
import 'package:visual_notes/src/ui/pages/new_note/widgets/date_form_field.dart';
import 'package:visual_notes/src/ui/pages/new_note/widgets/image_form_field.dart';
import 'package:visual_notes/src/ui/pages/new_note/widgets/status_form_field.dart';
import 'package:visual_notes/src/ui/pages/new_note/widgets/submit_button.dart';
import 'package:visual_notes/src/validators/note_validators.dart';

class NoteForm extends StatefulWidget {
  NoteForm({Key? key}) : super(key: key);

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  NoteStatus? _selectedStatus;
  String? _selectedImage;

  final spacer = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: fieldValidator,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            spacer,
            TextFormField(
              validator: fieldValidator,
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
        ));
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
      //TODO handle submission
    }
  }

  bool _formIsValid() {
    final formIsValid = _formKey.currentState!.validate();

    return formIsValid && _selectedStatus != null && _selectedImage != null;
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
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
