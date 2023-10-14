import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:note_application/view_model/bloc/cubit/note_cubit.dart';
import 'package:note_application/view_model/bloc/cubit/note_states.dart';
import 'package:note_application/view_model/utils/imgs_online.dart';
import '../../../view_model/utils/app_colors.dart';
import '../../components/widgets/note_widget.dart';
import '../add_note/add_note.dart';
import '../edit_note/edite_note.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NoteCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Notes App"),
        centerTitle: false,
        actions: const [
          Row(
            children: [
              Icon(Icons.filter_list_sharp),
              SizedBox(width: 12),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.output_rounded),
              ),
            ],
          ),
        ],
      ),
      body: BlocConsumer<NoteCubit, NoteStates>(
        listener: (BuildContext context, NoteStates state) {},
        builder: (BuildContext context, state) {
          return Visibility(
            visible: cubit.notes.isNotEmpty,
            replacement: Center(
              child: Lottie.network(
                Imgs.lottei,
                width: 500,
                height: 300,
              ),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => NoteWidget(
                  onPressedDelete: () {
                    cubit.deleteNote();
                  },
                  note: cubit.notes[index],
                  onTap: () {
                    cubit.currentindex = index;
                    cubit.changeIndex(index);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditeNote();
                    }));
                  }),
              itemCount: cubit.notes.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return BlocListener<NoteCubit, NoteStates>(
                listener: (BuildContext context, state) {
                  if (state is AddNoteState) {
                    Navigator.pop(context);
                  }
                },
                child: const SizedBox(
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AddNote(),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: AppColors.grey,
        child: const Icon(Icons.add_rounded, color: AppColors.white),
      ),
    );
  }
}
