import 'package:flutter/material.dart';
import 'package:note_application/model/note_model.dart';
import '../../../view_model/utils/app_colors.dart';
import '../text_custom.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key, required this.note, this.onTap, this.onPressedDelete}) : super(key: key);
  final void Function()? onTap;
  final void Function()? onPressedDelete;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.only(top: 25, right: 0, bottom: 25, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 0, top: 5, bottom: 22),
                    child: TextCustom(
                      text: note.title,
                      fontSize: 24,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: TextCustom(
                    text: note.subtitle,
                    fontSize: 18,
                    color: AppColors.grey,
                  ),
                  trailing: IconButton(
                    onPressed: onPressedDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.black,
                      size: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextCustom(
                        text: note.start_date,
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                      const SizedBox(width:20 ,),
                      TextCustom(
                        text: note.end_date,
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}