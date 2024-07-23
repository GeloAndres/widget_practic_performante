import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app_performance/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gelonzio material 3'),
        ),
        body: _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItems = appMenuItems[index];

        return _CustomerListTitle(menuItems: menuItems);
      },
    );
  }
}

class _CustomerListTitle extends StatelessWidget {
  const _CustomerListTitle({
    required this.menuItems,
  });

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItems.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_back_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subtitle),
      onTap: () {
        context.push(menuItems.link);
      },
    );
  }
}
