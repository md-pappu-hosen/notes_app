import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/utils.dart';
import 'package:notes_apps/controllers/notes_controller.dart';
import 'package:notes_apps/customs/custom_button.dart';
import 'package:notes_apps/models/notes_model.dart';
import 'package:notes_apps/utils/colors.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {'isUpdate': false, 'note': null};
    final bool isUpdate = arg['isUpdate'] ?? false;
    final note = arg['note'] == null ? null : arg['note'] as NotesModel;
    final int? index = arg['index'] == null ? null : arg['index'] as int;

    final titleController = TextEditingController(
      text: isUpdate ? note!.title : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!.description : null,
    );
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                minLines: 1,
                maxLines: 39,
                decoration: InputDecoration(
                  hintText: 'describe your note',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        title: 'Save Changes',
        onTab: () {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty) {
            Get.snackbar('Error', 'Title And Description Is Required');
          } else {
            isUpdate
                ? controller.updateNote(
                    index!,
                    NotesModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      createdDate: note!.createdDate,
                      updatedDate: DateTime.now(),
                    ),
                  )
                : controller.addNotes(
                    NotesModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      createdDate: DateTime.now(),
                    ),
                  );
            Get.back();
          }
        },
      ),
    );
  }
}
