import 'package:get/get.dart';
import 'package:notes_apps/note/note.dart';
import 'package:notes_apps/views/home.dart';
import 'package:notes_apps/routes/routes_names.dart';

class RoutesPages {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RoutesNames.home, page: () => const HomeScreen()),
    GetPage(name: RoutesNames.noteScreen, page: () => const NoteScreen()),
  ];
}
