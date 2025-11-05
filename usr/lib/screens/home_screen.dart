import 'package:flutter/material.dart';
import '../models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Workspace> workspaces = [
    Workspace(
      id: '1',
      name: 'Personal',
      boards: [
        Board(
          id: '1',
          name: 'To Do',
          tasks: [
            Task(
              id: '1',
              title: 'Complete project setup',
              description: 'Set up Flutter app with basic structure',
              status: 'In Progress',
              dueDate: DateTime.now().add(const Duration(days: 3)),
              assignees: ['Me'],
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: workspaces.length,
        itemBuilder: (context, index) {
          final workspace = workspaces[index];
          return ListTile(
            title: Text(workspace.name),
            subtitle: Text('${workspace.boards.length} boards'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/board',
                arguments: workspace,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new workspace
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}