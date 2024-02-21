import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/features/todos/controllers/todo_controller.dart';
import 'package:todo_flutter/features/todos/screens/todos_screen.dart';
import 'package:todo_flutter/shared/services/local_storage/local_storage_service.dart';
import 'package:todo_flutter/shared/services/local_storage/todos_local_storage_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodosController(
        TodosLocalStorageService(
          LocalStorageService(),
        ),
      ),
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade500),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blueGrey.shade600,
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 18),
            )),
        home: const TodosScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
