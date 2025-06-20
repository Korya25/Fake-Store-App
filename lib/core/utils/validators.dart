class Validators {
  static bool isValidEmail(String email) {
   // return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
    return email.trim().length >= 2;

  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isValidName(String name) {
    return name.trim().length >= 2;
  }
}
