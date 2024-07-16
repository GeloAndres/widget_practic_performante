import 'package:flutter/material.dart';
import 'package:proyect_practic_concept/configuration/helpers/get_yes_no_answer.dart';
import 'package:proyect_practic_concept/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<Message> message = [
    const Message(text: 'Hola mi amor, como estas ?? ', fromWho: FromWho.my),
    const Message(text: 'como te has sentido', fromWho: FromWho.my),
    const Message(text: 'que tal va tu dia ?? ', fromWho: FromWho.my),
    const Message(text: 'Holiiiiii', fromWho: FromWho.hers),
    const Message(
        text: 'Bien, aqui aburrida, dandole a la vida', fromWho: FromWho.hers),
    const Message(text: 'como estas tu ? que haces ? ', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    final Message messageInt = Message(text: text, fromWho: FromWho.my);
    message.add(messageInt);

    herReply();
    notifyListeners();
    moveToScroll();
  }

  Future<void> herReply() async {
    final herMessage = await GetYesNoAnswer().getAnswer();
    message.add(herMessage);
    notifyListeners();
    moveToScroll();
  }

  void moveToScroll() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutSine);
  }
}
