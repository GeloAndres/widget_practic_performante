import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gelonzio_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Buttons_screen'),
      ),
      body: const _ButtomCustomer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.reply_outlined),
      ),
    );
  }
}

class _ButtomCustomer extends StatelessWidget {
  const _ButtomCustomer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Geloncio')),
            const ElevatedButton(
                onPressed: null, child: Text('El button null')),
            OutlinedButton(
                onPressed: () {}, child: const Text('El OutLinedbutton')),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Icon(Icons.tab),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              label: const Icon(Icons.accessibility),
            ),
            TextButton(onPressed: () {}, child: const Text('The Text button')),
            const GelonzioButton(),
            TextButton.icon(
                onPressed: () {}, label: const Icon(Icons.local_activity)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.telegram)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.read_more),
            ),
          ],
        ),
      ),
    );
  }
}
