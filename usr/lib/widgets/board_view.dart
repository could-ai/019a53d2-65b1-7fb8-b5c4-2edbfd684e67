import 'package:flutter/material.dart';
import '../models.dart';

class BoardView extends StatelessWidget {
  final Board board;

  const BoardView({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(board.name),
      ),
      body: ListView.builder(
        itemCount: board.tasks.length,
        itemBuilder: (context, index) {
          final task = board.tasks[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Text(task.status),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/task_detail',
                  arguments: task,
                );
              },
            ),
          );
        },
      ),
    );
  }
}