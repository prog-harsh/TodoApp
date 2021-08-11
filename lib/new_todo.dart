import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  NewTodo(this.addTodo);
  final Function addTodo;

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _descriptionController = TextEditingController();

  void saveData() {
    if (_descriptionController.text.isEmpty) {
      return;
    }
    final description = _descriptionController.text;
    widget.addTodo(description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _descriptionController,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  saveData();
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
