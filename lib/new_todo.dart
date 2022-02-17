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
      child: Container(
        color: const Color(0xFFEFEEEE),
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _descriptionController,
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  saveData();
                  Navigator.of(context).pop();
                },
                child: Container(
                  // padding: const EdgeInsets.all(20),
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEEEE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: const Offset(-7.0, -7.0),
                        blurRadius: 8,
                        // spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(7.0, 7.0),
                        blurRadius: 8,
                        // spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
