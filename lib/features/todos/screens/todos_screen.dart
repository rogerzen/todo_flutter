import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/features/todos/controllers/todo_controller.dart';
import 'package:todo_flutter/features/todos/widgets/todo_checkbox_widget.dart';
import 'package:todo_flutter/shared/widget/text_widget.dart';

import '../../../shared/models/todo_model.dart';
import '../../add_todo/screens/add_todos_screen.dart';
import '../widgets/add_todo_icon_widget.dart';
import '../widgets/loding_error_widget.dart';
import '../widgets/todo_date_widget.dart';
import '../widgets/todo_title_and_description_widget.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadTodosAndDoneTodos();
    });
    super.initState();
  }

  Future<void> loadTodosAndDoneTodos() async {
    isLoading = true;
    error = null;
    final todosCtrl = context.read<TodosController>();

    final String? errorLoadingTodos = await todosCtrl.loadTodos();

    final String? errorLoadingDoneTodos = await todosCtrl.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(() {
        error = errorLoadingTodos ?? errorLoadingDoneTodos;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void _goToAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const AddTodoScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final todosCtrl = context.watch<TodosController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          AddTodoIconWidget(
            goToAddTodoScreen: _goToAddTodoScreen,
          ),
        ],
      ),
      body: isLoading || error != null
          ? LodingErrorWidget(
              isLoading: isLoading,
              error: error,
              loadTodosAndDoneTodos: loadTodosAndDoneTodos,
            )
          : todosCtrl.todos.isEmpty
              ? const Center(
                  child: TextWidget('Você ainda não possui nehuma tarefa'),
                )
              : ListView.builder(
                  itemCount: todosCtrl.todos.length,
                  itemBuilder: (_, int index) {
                    final TodoModel todo = todosCtrl.todos[index];
                    return Row(
                      children: [
                        TodoCheckboxWidget(todo),
                        const SizedBox(width: 12),
                        TodoTitleAndDescrptionWidget(todo),
                        TodoDateWidget(todo),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await todosCtrl.removeTodo(todo.id);
                          },
                        )
                      ],
                    );
                  }),
    );
  }
}
