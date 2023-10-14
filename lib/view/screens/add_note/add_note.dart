import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_application/view/components/button_custom.dart';
import 'package:note_application/view/components/text_custom.dart';
import 'package:note_application/view_model/bloc/cubit/note_cubit.dart';

import '../../components/textfeild_custom.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NoteCubit.get(context);
    cubit.restControllers();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextCustom(text: "Add Note"),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          CustomTextField(
                            labelText: 'Title',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller: cubit.titleController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Content',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.none,
                            controller: cubit.contentController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Start Date',
                            readOnly: true,
                            textInputAction: TextInputAction.none,
                            controller: cubit.startController,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 2, 11),
                                lastDate: DateTime(2025),
                              ).then((value) {
                                if (value != null) {
                                  cubit.startController.text =
                                      DateFormat.yMEd().format(value);
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'End Date',
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            textInputAction: TextInputAction.none,
                            controller: cubit.endController,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 2, 11),
                                lastDate: DateTime(2025),
                              ).then((value) {
                                if (value != null) {
                                  cubit.endController.text =
                                      DateFormat.yMEd().format(value);
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ButtonCustom(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.addNote();
                }
              },
              text: "Add Note")
        ],
      ),
    );
  }
}
