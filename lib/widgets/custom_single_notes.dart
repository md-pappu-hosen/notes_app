import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_apps/controllers/notes_controller.dart';
import 'package:notes_apps/routes/routes_names.dart';
import 'package:notes_apps/utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {
  final int index;
  const CustomSingleNotes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final note = controller.notes.elementAt(index);
    final createdDateFormat = DateFormat.yMMMMd().format(note.createdDate);
    final createdTimeFormat = DateFormat.jm().format(note.createdDate);

    final updateDateFormat = DateFormat.yMMMMd().format(
      note.updatedDate ?? DateTime.now(),
    );
    final updateTimeFormat = DateFormat.jm().format(
      note.updatedDate ?? DateTime.now(),
    );
    return InkWell(
      onTap: () {
        Get.toNamed(
          RoutesNames.noteScreen,
          arguments: {'isUpdate': true, 'note': note, 'index': index},
        );
        print('object');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(.3)),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundColor,
            ),
          ),
          title: Text(
            note.title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black.withOpacity(.5)),
              ),
              note.updatedDate != null
                  ? Text(
                      'Update:$updateDateFormat - $updateTimeFormat',
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                        fontSize: 12,
                      ),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$createdDateFormat - $createdTimeFormat',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Get.snackbar(
                        'Delete',
                        '${note.title} has been delete!',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      controller.deleleNote(index);
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
