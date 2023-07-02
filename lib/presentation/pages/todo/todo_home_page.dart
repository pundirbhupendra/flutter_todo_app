import '../../../core/utils/todo_list_tile_shimmer.dart';
import '../../blocs/todo/todo_cubit.dart';
import '../setting/setting_page.dart';
import '../../blocs/todo_form/todo_form_cubit.dart';
import 'add_todo_page.dart';
import '../../widgets/todo/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomePage extends StatelessWidget {
  static const routeName = '/TodoHomePage';

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoFormCubit, TodoFormState>(
      listener: (BuildContext context, TodoFormState todoFormState) {
        if (todoFormState.status == ApiStatus.success ||
            todoFormState.status == ApiStatus.initial) {
          context.read<TodoCubit>().getAllTodoData();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, SettingPage.routeName);
                }),
          ],
        ),
        body: BlocBuilder<TodoCubit, TodoState>(
          builder: (BuildContext context, TodoState state) {
            if (state.status == ApiStatus.initial) {
              context.read<TodoCubit>().getAllTodoData();
              return const Center(
                child: SizedBox(),
              );
            } else if (state.status == ApiStatus.loading) {
              return const TodoListTileShimmer();
            } else if (state.status == ApiStatus.success) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: state.todoModel?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: TodoCard(
                          key: ValueKey(index),
                          todoModel: state.todoModel?[index]),
                    );
                  },
                ),
              );
            } else if (state.status == ApiStatus.failure) {
              return const Center(
                child: Text("Error Loading"),
              );
            } else {
              return const Center(
                child: Text("Unexpected State"),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          onPressed: () {
            Navigator.pushNamed(context, AddTodoPage.routeName);
          },
        ),
      ),
    );
  }
}
