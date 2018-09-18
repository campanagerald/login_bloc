import 'package:rxdart/rxdart.dart';
import '../models/login_model.dart';
import '../mixins/validation_mixin.dart';

class Bloc extends Object with ValidationMixin {
  final BehaviorSubject<LoginModel> _login =
      BehaviorSubject<LoginModel>(seedValue: LoginModel(null, null));

  // add data to stream
  void onChangeLoginModel({String email, String password}) {
    LoginModel loginModel =
        _login.value.copyWith(email: email, password: password);

    _login.sink.add(loginModel);
  }

  // retrieve data to stream
  Observable<LoginModel> get login => _login.stream.transform(validateLogin);

  void dispose() {
    _login.close();
  }
}
