class Validation {
  static bool isEmail(String email) {
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
  }

  static bool isNumberPhone(String email) {
    return email.length == 10;
  }

  static bool hasSpaceCharacter(String s) {
    return s.contains(" ");
  }
}