import 'package:flutter/material.dart';
import 'package:todo_flutter/shared/widget/text_widget.dart';

class LodingErrorWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final void Function() loadTodosAndDoneTodos;

  const LodingErrorWidget({
    Key? key,
    required this.loadTodosAndDoneTodos,
    required this.isLoading,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator.adaptive()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(
                  'Erro!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: loadTodosAndDoneTodos,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: const TextWidget(
                    "Tentar Novamente",
                  ),
                ),
              ],
            ),
    );
  }
}
