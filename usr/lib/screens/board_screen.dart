import 'package:flutter/material.dart';
import '../models.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Workspace workspace;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    workspace = ModalRoute.of(context)!.settings.arguments as Workspace;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workspace.name),
      ),
      body: ListView.builder(
        itemCount: workspace.boards.length,
        itemBuilder: (context, index) {
          final board = workspace.boards[index];
          return ExpansionTile(
            title: Text(board.name),
            children: board.tasks.map((task) => ListTile(
              title: Text(task.title),
              subtitle: Text('Status: ${task.status}'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/task_detail',
                  arguments: task,
                );
              },
            )).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new board
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}