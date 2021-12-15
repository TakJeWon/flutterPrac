import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ToDoListApp());
}
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
}

class ToDoListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do list',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ToDoListHomePage(),
    );
  }

}

class ToDoListHomePage extends StatefulWidget {

  @override
  _ToDoListHomePageState createState() => _ToDoListHomePageState();
}


class _ToDoListHomePageState extends State<ToDoListHomePage> {

  //할일 목록 저장
  final _items = <Todo>[];

  // 할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();

  void dispose(){
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            Row(
              children: <Widget>[

                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),

                ElevatedButton(
                  onPressed: () => _addTodo(Todo(_todoController.text)),
                  child: Text('추가'),
                ),
              ],
            ),

            Expanded(
              child: ListView(
                children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () => _toggleTodo(todo),
      title: Text(
        todo.title,
        style: todo.isDone? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        )
            : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = '';
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}

