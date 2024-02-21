import 'dart:convert';
import 'dart:developer';

import 'package:todo_flutter/shared/const/messages_const.dart';
import 'package:todo_flutter/shared/erros/Local_storage_exception.dart';
import 'package:todo_flutter/shared/services/local_storage/local_storage_service.dart';

import '../../models/todo_model.dart';

class TodosLocalStorageService {
  final String todosKey = 'todosKey';
  final String doneTodosKey = 'doneTodosKey';

  final LocalStorageService _localStorageService;

  TodosLocalStorageService(this._localStorageService);

  Future<String?> setTodos(List<TodoModel> todos) async {
    try {
      final String data = jsonEncode(
        todos.map((todo) => todo.toMap()).toList(),
      );

      await _localStorageService.set(todosKey, data);
      return null;
    } on LocalStorageException {
      return 'Erro ao salvar tarefas.';
    } catch (error, st) {
      log('Erro saving todos', error: error, stackTrace: st);
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<TodoModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _localStorageService.get(todosKey);

      if (todosJson != null) {
        final todos = (jsonDecode(todosJson) as List)
            .map<TodoModel>(
              (todo) => TodoModel.fromMap(todo),
            )
            .toList();

        return (null, todos);
      }

      return (null, <TodoModel>[]);
    } on LocalStorageException {
      return ('Erro ao carregar tarefas.', null);
    } catch (error, st) {
      log('Erro loading todos', error: error, stackTrace: st);
      return (defaultErrorMessage, null);
    }
  }

  Future<String?> setDoneTodos(List<String> doneTodos) async {
    try {
      final String data = jsonEncode(doneTodos);

      await _localStorageService.set(doneTodosKey, data);
      return null;
    } on LocalStorageException {
      return 'Erro ao salvar tarefas feitas.';
    } catch (error, st) {
      log('Erro saving done todos', error: error, stackTrace: st);
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<String>? doneTodos)> getDoneTodos() async {
    try {
      final String? doneTodoJson = await _localStorageService.get(doneTodosKey);

      if (doneTodoJson != null) {
        final doneTodos = (jsonDecode(doneTodoJson) as List).cast<String>();

        return (null, doneTodos);
      }

      return (null, <String>[]);
    } on LocalStorageException {
      return ('Erro ao carregar tarefas feitas.', null);
    } catch (error, st) {
      log('Erro loading done todos', error: error, stackTrace: st);
      return (defaultErrorMessage, null);
    }
  }
}
