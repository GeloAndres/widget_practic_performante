import 'package:proyect_practic_concept/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:proyect_practic_concept/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJonMap(response.data);

    return Message(
        text: yesNoModel.text,
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.imageUrl);
  }
}
