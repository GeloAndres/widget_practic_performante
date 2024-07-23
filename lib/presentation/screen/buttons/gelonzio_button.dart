import 'package:flutter/material.dart';

class GelonzioButton extends StatelessWidget {
  const GelonzioButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Geloncio el personalizado',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
