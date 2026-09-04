abstract class AppValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your full name";
    }

    final name = value.trim();

    if (name.split(RegExp(r'\s+')).length < 2) {
      return "Please enter your full name";
    }

    final nameRegex = RegExp(
      r"^[a-zA-Z\u0600-\u06FF]+(?:[ '-][a-zA-Z\u0600-\u06FF]+)*$",
    );

    if (!nameRegex.hasMatch(name)) {
      return "Please enter a valid name";
    }

    final lettersOnly = name.replaceAll(RegExp(r"[^a-zA-Z\u0600-\u06FF]"), "");

    if (lettersOnly.length < 3) {
      return "Name must be at least 3 characters";
    }

    if (name.length > 60) {
      return "Name is too long";
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your phone number";
    }

    final phone = value.trim();

    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

    if (!phoneRegex.hasMatch(phone)) {
      return "Please enter a valid phone number";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }

    final email = value.trim();

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      return "Please enter a valid email address";
    }

    return null;
  }

  // Used when creating a new account.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please create a password";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain an uppercase letter";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain a lowercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain a number";
    }

    return null;
  }

  // Used when signing in.
  static String? validatePasswordLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  // Used when confirming a newly created password.
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }

    // Don't compare against an invalid password.
    if (validatePassword(password) != null) {
      return null;
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }
}
