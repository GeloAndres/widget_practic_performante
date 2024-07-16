import 'package:proyect_practic_concept/domain/entities/message.dart';

class YesNoModel {
  final String text;
  final String? imageUrl;

  const YesNoModel({required this.text, this.imageUrl});

  factory YesNoModel.fromJonMap(Map<String, dynamic> json) =>
      YesNoModel(text: json['answer']);
  Message toMessageEntity() => Message(text: text);
}
