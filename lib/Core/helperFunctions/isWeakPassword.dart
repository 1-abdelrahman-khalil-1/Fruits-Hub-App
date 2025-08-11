bool isWeakPassword(String password) {
    if (password.length < 8) return false;

    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));

    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')); // رمز خاص

    return !( hasLowerCase && hasDigits);
  }