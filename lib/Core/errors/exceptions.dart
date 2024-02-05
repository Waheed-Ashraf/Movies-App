import 'package:movies_app/Core/network/error_message_model.dart';

class ServerErrors implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerErrors({required this.errorMessageModel});
}
