class LoginValidator {
  static Function(String) validateEmail = (String email) {
    if (email != null) {
      if (!email.contains('@')) {
        return 'Invalid email address';
      }
    }
  };

  static Function(String) validatePassword = (String password) {
    if (password != null) {
      if (password.length < 3) {
        return 'Password must atleast 4 characters';
      }
    }
  };
}
