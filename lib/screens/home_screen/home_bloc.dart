import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_me/data/database_helper.dart';
import 'package:keep_me/model/note_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DatabaseHelper db = DatabaseHelper.instance;

  HomeBloc() : super(InitialHomeState()) {
    on<OnAllTabClickedEvent>((event, emit) async {
      List<NoteModel> notes = [];
      List<Map<String, dynamic>> dbNotes = await db.queryAllNotes();
      for (dynamic dbNote in dbNotes) {
        notes.add(NoteModel(
            title: dbNote[DatabaseHelper.COLUMN_TITLE],
            content: dbNote[DatabaseHelper.COLUMN_CONTENT],
            category: dbNote[DatabaseHelper.COLUMN_CATEGORY]));
      }
      emit(AllNotesLoadedHomeState(notes: notes));
    });
  }
}

sealed class HomeEvent {}

class OnAllTabClickedEvent extends HomeEvent {}

sealed class HomeState extends Equatable {
  List<NoteModel> notes = [];
  HomeState({required this.notes});
  @override
  List<Object?> get props => [notes];
}

class InitialHomeState extends HomeState {
  InitialHomeState({List<NoteModel> notes = const []}) : super(notes: notes);
}

class AllNotesLoadedHomeState extends HomeState {
  AllNotesLoadedHomeState({required List<NoteModel> notes})
      : super(notes: notes);
}
