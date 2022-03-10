import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:todo/new_todo.dart';
import 'home.dart';
import 'model/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Ubuntu',
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Random random = Random();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPrefrences();
    super.initState();
  }

  void initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> string = (_todo.map((e) => json.encode(e.toMap())).toList());

    sharedPreferences.setStringList('spTodo', string);
  }

  void loadData() {
    List<String>? string = sharedPreferences.getStringList('spTodo');
    if (string != null) {
      _todo = string.map((e) => Todo.fromJson(json.decode(e))).toList();
      setState(() {});
    }
  }

  void _startNewTodo(ctx) {
    showModalBottomSheet(
        context: ctx,
        isDismissible: false,
        builder: (bctx) {
          return NewTodo(_addTodo);
        });
  }

  void _removeTodo(id) {
    setState(() {
      _todo.removeWhere((element) => element.id == id);
    });
    saveData();
  }

  void _addTodo(desc) {
    final newTodo = Todo(
      id: desc + random.nextDouble().toString(),
      description: desc,
    );
    //print(newTodo.id);
    setState(() {
      _todo.add(newTodo);
    });
    saveData();
  }

  List<Todo> _todo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      appBar: AppBar(
        title: const Text(
          'Todos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Home(_todo, _removeTodo),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () {
          _startNewTodo(context);
          setState(() {});
        },
        child: const Icon(
          Icons.add_sharp,
          size: 30,
        ),
      ),
    );
  }
}
