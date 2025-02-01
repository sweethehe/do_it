import 'package:do_it/common_widgets/customButton.dart';
import 'package:do_it/common_widgets/inputBox.dart';
import 'package:do_it/common_widgets/show_dialog.dart';
import 'package:do_it/common_widgets/to_do_tile.dart';
import 'package:do_it/utils/ui.dart';
import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  TextEditingController controller = TextEditingController();

  List toDoTask = [
    ["Welcome to do-it ♡", false],
  ];

  List tasksDone = [];

  void checkBoxChanged(bool? value, int index, bool isToDoList) {
    setState(() {
      if (isToDoList) {
        toDoTask[index][1] = value ?? false;
        if (toDoTask[index][1] == true) {
          tasksDone.add(toDoTask[index]);
          toDoTask.removeAt(index);
        }
      } else {
        tasksDone[index][1] = value ?? false;
        if (tasksDone[index][1] == false) {
          toDoTask.add(tasksDone[index]);
          tasksDone.removeAt(index);
        }
      }
    });
  }

  void showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Let's create a new task !",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),
                InputBox(
                    controller: controller,
                    label: "New note ♡",
                    hintText: "What do you wanna do ?",
                    obscureText: false),
                const SizedBox(height: 50),
                CustomButton(
                    onPressed: () {
                      setState(() {
                        toDoTask.add([controller.text, false]);
                        controller.clear();
                        Navigator.pop(context);
                      });
                    },
                    text: "Create ♡",
                    myColor: pastelPink,
                    width: 200),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double tileHeight = 120;
    double toDoHeight = toDoTask.length * tileHeight;
    double doneHeight = tasksDone.length * tileHeight;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TO DO  -  ${toDoTask.length}",
                            style: const TextStyle(fontSize: 18)),
                        IconButton(
                            onPressed: () {
                              toDoTask.isNotEmpty
                                  ? buildDialogChoice(
                                      context,
                                      "Do you really want to clear all the task ?",
                                      "Yes ♡",
                                      "No", go: () {
                                      setState(() {
                                        toDoTask.clear();
                                      });
                                      Navigator.pop(context);
                                    })
                                  : buildDialogChoice(
                                      context,
                                      "There's no task here :(",
                                      "Okay",
                                      "", go: () {
                                      setState(() {
                                        toDoTask.clear();
                                      });
                                      Navigator.pop(context);
                                    });
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: pink,
                            ))
                      ],
                    ),
                  ),
                  if (toDoTask.isNotEmpty) ...[
                    SizedBox(
                      height: toDoHeight,
                      child: ListView.builder(
                          itemCount: toDoTask.length,
                          itemBuilder: (context, index) {
                            return ToDoTile(
                              taskName: toDoTask[index][0],
                              isTaskComplete: toDoTask[index][1],
                              onChanged: (value) =>
                                  checkBoxChanged(value, index, true),
                              onPressed: () {
                                setState(() {
                                  toDoTask.removeAt(index);
                                });
                              },
                            );
                          }),
                    ),
                    Center(
                      child: CustomButton(
                          onPressed: () {
                            showAddTaskModal(context);
                          },
                          text: "Add a new task",
                          myColor: saumon,
                          width: 200),
                    )
                  ] else ...[
                    const Center(
                        child: Text(
                      "There's no task for the moment...",
                      style: TextStyle(color: grey, fontSize: 17),
                    )),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: CustomButton(
                          onPressed: () {
                            showAddTaskModal(context);
                          },
                          text: "Add a new task",
                          myColor: saumon,
                          width: 200),
                    )
                  ],
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("D O N E  -  ${tasksDone.length}",
                            style: const TextStyle(fontSize: 18)),
                        IconButton(
                            onPressed: () {
                              tasksDone.isNotEmpty
                                  ? buildDialogChoice(
                                      context,
                                      "Do you really want to clear all the task ?",
                                      "Yes ♡",
                                      "No", go: () {
                                      setState(() {
                                        tasksDone.clear();
                                      });
                                      Navigator.pop(context);
                                    })
                                  : buildDialogChoice(
                                      context,
                                      "There's no task here :(",
                                      "Okay",
                                      "", go: () {
                                      setState(() {
                                        tasksDone.clear();
                                      });
                                      Navigator.pop(context);
                                    });
                            },
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: pink,
                            ))
                      ],
                    ),
                  ),
                  if (tasksDone.isNotEmpty) ...[
                    SizedBox(
                      height: doneHeight,
                      child: ListView.builder(
                          itemCount: tasksDone.length,
                          itemBuilder: (context, index) {
                            return ToDoTile(
                              taskName: tasksDone[index][0],
                              isTaskComplete: tasksDone[index][1],
                              onChanged: (value) =>
                                  checkBoxChanged(value, index, false),
                              onPressed: () {
                                setState(() {
                                  tasksDone.removeAt(index);
                                });
                              },
                            );
                          }),
                    )
                  ] else ...[
                    const Center(
                        child: Text(
                      "It's time to get something done!",
                      style: TextStyle(color: grey, fontSize: 17),
                    ))
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
