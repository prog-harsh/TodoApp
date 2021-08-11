import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class Home extends StatelessWidget {
  final List<Todo> _todo;
  final Function remove;
  Home(this._todo, this.remove);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.84,
        child: _todo.isEmpty
            ? Center(
                child: Image(
                  height: 200,
                  image: AssetImage('image/empty.png'),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _todo.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(
                          _todo[i].description,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 28,
                          ),
                          onPressed: () => remove(_todo[i].id),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
