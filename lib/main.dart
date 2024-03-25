import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatefulWidget {
  @override
  Mainscreenstate createState() => Mainscreenstate();
}

class Mainscreenstate extends State<Mainscreen> {
  List<String> itemsInTodo = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO List"),
        backgroundColor: Color.fromARGB(255, 86, 130, 223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter item to add",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      String newTodo = textController.text;
                      if (newTodo.isNotEmpty) {
                        itemsInTodo.add(newTodo);
                        textController.clear();
                      }
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              controller: textController,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: itemsInTodo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemsInTodo[index]),
                    tileColor: Color.fromARGB(255, 232, 220, 220),
                    onTap: () {
                      setState(() {
                        itemsInTodo.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
