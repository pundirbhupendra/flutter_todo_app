import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/todo/todo_model.dart';
import '../../blocs/todo/todo_cubit.dart';

class TodoCard extends StatelessWidget {
  final TodoModel? todoModel;

  const TodoCard({Key? key, required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoModel?.task ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    todoModel?.description ?? 'N/A',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    if (todoModel?.id != null) {
                      context
                          .read<TodoCubit>()
                          .deleteTodos(todoModel?.id.toString() ?? '');
                    }
                  },
                  icon: const Icon(Icons.delete)))
        ],
      ),
    );
  }
}
