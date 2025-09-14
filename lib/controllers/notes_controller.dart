import 'package:get/get.dart';
import 'package:notes_apps/models/notes_model.dart';

class NotesController extends GetxController {
  RxList<NotesModel> notes = <NotesModel>[].obs;
  addNotes(NotesModel notesData) {
    notes.add(notesData);
    update();
  }

  deleleNote(int index) {
    notes.removeAt(index);
    update();
  }

  updateNote(int index, NotesModel notesData) {
    notes[index] = notesData;
    update();
  }
}
