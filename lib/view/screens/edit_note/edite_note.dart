import 'package:flutter/material.dart';
import 'package:note_application/view/components/button_custom.dart';
import 'package:note_application/view_model/bloc/cubit/note_cubit.dart';
import '../../components/textfeild_custom.dart';
import '../../components/text_custom.dart';

class EditeNote extends StatelessWidget {
  const EditeNote({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=NoteCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const TextCustom(text: 'Edit Note'), // Corrected spelling
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              const SizedBox(height: 12),
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
                                controller: cubit.titleController,
                                labelText: 'Title',
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: 20),
                               CustomTextField(
                                 controller: cubit.contentController,
                                labelText: 'Content',
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.none,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                controller: cubit.startController,
                                labelText: 'Start Date',
                                readOnly: true,
                                textInputAction: TextInputAction.none,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022, 2, 11),
                                    lastDate: DateTime(2025),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                controller: cubit.endController,
                                labelText: 'End Date',
                                readOnly: true,
                                keyboardType: TextInputType.none,
                                textInputAction: TextInputAction.none,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022, 2, 11),
                                    lastDate: DateTime(2025),
                                  );
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
              const SizedBox(height: 20),
              ButtonCustom(onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.editNote().then((value) {
                    Navigator.pop(context);
                  });
                }
              }, text: "Edit Your Note")
            ],
          ),
        ),
      ),
    );
  }
}
