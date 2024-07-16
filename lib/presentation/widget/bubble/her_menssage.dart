import 'package:flutter/material.dart';

class HerMenssageBubble extends StatelessWidget {
  final String content;
  final String? imageUrl;

  const HerMenssageBubble({super.key, required this.content, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.purple),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
      ],
    );
  }
}
