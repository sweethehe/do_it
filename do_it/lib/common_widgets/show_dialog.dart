import 'package:do_it/common_widgets/inputBox.dart';
import 'package:do_it/utils/ui.dart';
import 'package:flutter/material.dart';

Future buildDialogChoice(
    BuildContext context, String title, String button, String button2,
    {Function()? go}) {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              button2,
                              style: const TextStyle(fontSize: 18, color: saumon),
                            )),
                        TextButton(
                            onPressed: go,
                            child: Text(
                              button,
                              style: const TextStyle(fontSize: 18, color: saumon),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
}

Future buildDialogInput(
    BuildContext context, String title, String button, TextEditingController controller,
    {Function()? go}) {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    InputBox(controller: controller, label: "New note ♡", hintText: "What do you want to do ?", obscureText: false),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(fontSize: 18, color: black),
                            )),
                        TextButton(
                            onPressed: go,
                            child: Text(
                              button,
                              style: const TextStyle(fontSize: 18, color: pink),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
}