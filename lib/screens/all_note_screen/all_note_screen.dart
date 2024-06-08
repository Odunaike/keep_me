import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_me/model/note_model.dart';
import 'package:keep_me/screens/home_screen/home_bloc.dart';

class AllNoteScreen extends StatefulWidget {
  const AllNoteScreen({super.key});

  @override
  State<AllNoteScreen> createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is AllNotesLoadedHomeState) {
                return NoteList(notes: state.notes);
              } else if (state is InitialHomeState) {
                return Text("initial");
              } else {
                return Text("error");
              }
            },
            buildWhen: (previous, current) {
              return previous.notes.length != current.notes.length;
            },
          )),
    );
    ;
  }
}

class NoteList extends StatelessWidget {
  List<NoteModel> notes;
  NoteList({required this.notes, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => NoteConatainer(note: notes[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: notes.length);
  }
}

class NoteConatainer extends StatelessWidget {
  NoteModel note;
  NoteConatainer({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 2,
      minLeadingWidth: 5,
      title: Text(
        note.title,
        style: TextStyle(fontSize: 23),
      ),
      subtitle: Text(
        note.content,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
