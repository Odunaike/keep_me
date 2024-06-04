import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:keep_me/screens/add_note_screen.dart';
import 'package:keep_me/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(home: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(10), child: HomeScreen()),
      ),
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        child: Icon(
          HeroiconsSolid.plus,
          size: 35,
        ),
      ),
    );
  }
}
