import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class Home extends StatelessWidget {
  final List<Todo> _todo;
  final Function remove;
  Home(this._todo, this.remove);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFEFEEEE),
        height: MediaQuery.of(context).size.height * 0.84,
        child: _todo.isEmpty
            ? Center(
                child: Image(
                  height: 200,
                  image: AssetImage('image/empty.png'),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: _todo.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    // elevation: 6,
                    margin: const EdgeInsets.all(6),
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEEEE),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: -Offset(7.0, 7.0),
                          blurRadius: 8,
                          // spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(7.0, 7.0),
                          blurRadius: 8,
                          // spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(
                          _todo[i].description,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 25,
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
