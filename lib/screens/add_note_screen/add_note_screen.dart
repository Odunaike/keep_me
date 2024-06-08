import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:keep_me/model/note_model.dart';
import 'package:keep_me/screens/add_note_screen/add_cubit.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String noteTitle = "";
  String noteContent = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is CompletedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Data inserted"),
            duration: Duration(seconds: 3),
          ));
        } else if (state is LoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("loading"),
            duration: Duration(seconds: 3),
          ));
        } else if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("error occurred"),
            duration: Duration(seconds: 3),
          ));
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AddNoteAppBar(),
        ),
        backgroundColor: Color.fromARGB(233, 255, 251, 191),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  noteTitle = value;
                });
              },
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              decoration:
                  InputDecoration(hintText: "Title", border: InputBorder.none),
            ),
            TextField(
                maxLines: 17,
                onChanged: (value) {
                  setState(() {
                    noteContent = value;
                  });
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: "Content", border: InputBorder.none)),
          ]),
        ),
        floatingActionButton: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<AddNoteCubit>().insertNote(NoteModel(
                      title: noteTitle, content: noteContent, category: null));
                },
                backgroundColor: Color.fromARGB(255, 15, 15, 15),
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                child: const Icon(HeroiconsSolid.check),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color.fromARGB(233, 205, 201, 138),
                  foregroundColor: Colors.black,
                  shape: const CircleBorder(),
                  child: const Icon(HeroiconsOutline.bars3))
            ],
          ),
        ),
      ),
    );
  }
}

class AddNoteAppBar extends StatelessWidget {
  const AddNoteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(233, 205, 201, 138),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    HeroiconsOutline.chevronLeft,
                    size: 30,
                  )),
            ),
          ),
          trailing: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(233, 205, 201, 138),
            ),
            child: Center(
              child: Icon(
                HeroiconsOutline.arrowUpOnSquare,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
