import 'package:flutter/material.dart';

class BoxTextInt extends StatelessWidget {
  final ValueChanged<String> onValue;
  const BoxTextInt({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outBorderApp = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final textDecoration = InputDecoration(
        hintText: 'Message....',
        enabledBorder: outBorderApp,
        focusedBorder: outBorderApp,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: textDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
      },
    );
  }
}
