import 'package:flutter/material.dart';
import 'package:todolistflutterapp/models/task.dart';

class NewTask extends StatefulWidget {
  final Function(Task) addTask;
  const NewTask(this.addTask, {Key? key}) : super(key: key);

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Category selectedCategory = Category.personal;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } else {
      final newTask = Task(
        title: _titleController.text,
        description: _descriptionController.text,
        date: DateTime(2023, 10, 16, 14, 30),
        category: selectedCategory,
      );
      widget.addTask(newTask); // Call the function to add the task
      Navigator.pop(context); // Close the bottom sheet
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Task title'),
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Task description'),
            ),
          ),
          DropdownButton<Category>(
            hint: Text('Select Category'),
            value: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            items: Category.values
                .map((category) => DropdownMenuItem<Category>(
                    value: category, child: Text(category.name)))
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {
              _submitTaskData();
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
