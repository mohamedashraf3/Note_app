import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/note_model.dart';
import 'note_states.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());

  static NoteCubit get(context) => BlocProvider.of<NoteCubit>(context);
  List<NoteModel> notes = [];
  int currentindex = 0;

  void changeIndex(int index) {
    currentindex = index;
    titleController.text = notes[index].title;
    contentController.text = notes[index].subtitle;
    startController.text = notes[index].start_date;
    endController.text = notes[index].end_date;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  void addNote() {
    NoteModel note = NoteModel(
      title: titleController.text,
      subtitle: contentController.text,
      start_date: startController.text,
      end_date: endController.text,
    );
    notes.add(note);
    restControllers();
    emit(AddNoteState());
  }

  Future<void> editNote() async {
    notes[currentindex].title = titleController.text;
    notes[currentindex].subtitle = contentController.text;
    notes[currentindex].start_date = startController.text;
    notes[currentindex].end_date = endController.text;
    restControllers();
    currentindex = 0;
    emit(EditNoteState());
  }

  Future<void> deleteNote() async {
    if (notes.isNotEmpty && currentindex >= 0 && currentindex < notes.length) {
      notes.removeAt(currentindex);
      emit(DeleteNoteState());
    }
  }

  void restControllers() {
    titleController.clear();
    contentController.clear();
    startController.clear();
    endController.clear();
  }
}
