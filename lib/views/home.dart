import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_apps/controllers/notes_controller.dart';
import 'package:notes_apps/routes/routes_names.dart';
import 'package:notes_apps/utils/colors.dart';
import 'package:notes_apps/widgets/custom_single_notes.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 15),
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My Notes',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Obx(
                      () => SingleChildScrollView(
                        child: Column(
                          children: [
                            controller.notes.isEmpty
                                ? Center(child: Text('no notes availeble'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.notes.length,
                                    primary: false,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      return CustomSingleNotes(index: index);
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Get.toNamed(RoutesNames.noteScreen),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
