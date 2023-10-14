import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/view/screens/home_screen/home.dart';
import 'package:note_application/view_model/bloc/cubit/note_cubit.dart';
import 'package:note_application/view_model/bloc/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NoteCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const Home(),
        debugShowCheckedModeBanner: !true,
      ),
    ),
  );
}
