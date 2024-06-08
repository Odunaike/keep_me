import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_me/screens/add_note_screen/add_cubit.dart';
import 'package:keep_me/screens/home_screen/home_bloc.dart';
import 'package:keep_me/screens/home_screen/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc())
      ],
      child: HomeScreen(),
    ));
  }
}
