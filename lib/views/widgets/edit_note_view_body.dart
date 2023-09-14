import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 23),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          CustomTextField(
            hintText: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 45),
          CustomTextField(
            hintText: widget.note.subTitle,
            maxLines: 5,
            onChange: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
