class FormValidators {
  static String? validateRequiredFields(String? value){
    if(value == null || value.isEmpty){
      return 'required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required';
    }

    final RegExp regex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    if (!regex.hasMatch(value.trim())) {
      return 'invalid email';
    }

    return null;
  }

  static String? validateStrongPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    final password = value.trim();

    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
    );

    if (!regex.hasMatch(password)) {
      return 'Min 8 chars, upper, lower, number & symbol';
    }

    return null;
  }
}