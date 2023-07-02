import '../../../core/presentation/some_went_wrong_page.dart';
import '../../blocs/todo_form/todo_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  static const routeName = '/AddTodoPage';

  @override
  State<StatefulWidget> createState() {
    return AddTodoPageState();
  }
}

class AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String? _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState?.validate() == true && _task != null) {
                _formKey.currentState?.save();
                BlocProvider.of<TodoFormCubit>(context).addTodoData(
                  _task!,
                  'N/A',
                );
              }
            },
          )
        ],
      ),
      body: BlocBuilder<TodoFormCubit, TodoFormState>(
        builder: (BuildContext context, TodoFormState todoFormState) {
          if (todoFormState.status == ApiStatus.initial) {
            return _buildBody(context);
          } else if (todoFormState.status == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (todoFormState.status == ApiStatus.success) {
            return _buildBody(context);
          } else if (todoFormState.status == ApiStatus.failure) {
            return _buildBody(context);
          }
          return SomeThingWentWrongPage();
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  _task = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
