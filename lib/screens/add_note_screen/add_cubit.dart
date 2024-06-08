import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keep_me/data/database_helper.dart';
import 'package:keep_me/model/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(LoadingState());

  DatabaseHelper db = DatabaseHelper.instance;

  void insertNote(NoteModel model) {
    db.insertNote(model.toMap());
    emit(CompletedState());
  }
}

abstract class AddNoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AddNoteState {}

class CompletedState extends AddNoteState {}

class ErrorState extends AddNoteState {}
