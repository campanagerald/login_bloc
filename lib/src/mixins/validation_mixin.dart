import 'dart:async';
import '../models/login_model.dart';

class ValidationMixin {
  final validateLogin = StreamTransformer<LoginModel, LoginModel>.fromHandlers(
    handleData: (LoginModel model, EventSink<LoginModel> sink) {
      final Map<String, String> errorMap = Map<String, String>();

      final String email = model.email;
      final String password = model.password;

      if (email != null && !email.contains('@')) {
        errorMap["email"] = "Enter a valid email";
      }

      if (email != null && password.length < 4) {
        errorMap["password"] = "Password must be at least 4 characters";
      }

      if (errorMap.isEmpty) {
        sink.add(model);
      } else {
        sink.addError(errorMap);
      }
    },
  );
}
