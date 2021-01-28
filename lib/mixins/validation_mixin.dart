class ValidationMixin {
  String pwd = '';

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (value.length < 1) {
      return 'Email cannot be empty';
    }

    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validateMobileNum(String value) {
    Pattern pattern = r'^\+[1-9]{1}[0-9]{3,14}$';
    RegExp regex = new RegExp(pattern);

    if (value.length < 1) {
      return 'Mobile number cannot be empty';
    }

    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 1) {
      return 'Password cannot be empty';
    } else if ((value.length < 8)) {
      return 'Password should be atlease 8 characters long';
    }
  }
}
