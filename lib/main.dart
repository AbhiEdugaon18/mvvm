import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_mvvm/view/todo_screens.dart';
import 'package:use_mvvm/viewmodels/todo_viewmodels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
