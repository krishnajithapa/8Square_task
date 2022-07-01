import 'package:intl/intl.dart';

class Validator {
  Validator();

  String? validateFirstName(String? value) {
    if (value!.isEmpty) {
      return "First Name is required.";
    }
    var regExString = RegExp("^[A-Za-z ]*\$");
    var regExLength = RegExp("^[A-Za-z ]{4,20}\$");
    final isValidString = regExString.hasMatch(value);
    final isValidLength = regExLength.hasMatch(value);
    if (!isValidString) {
      return "Please Enter Valid First Name";
    }
    if (!isValidLength) {
      return "First Name must be at least 4 characters in length";
    }

    return null;
  }

  String? validateLastName(String? value) {
    var regExString = RegExp("^[A-Za-z ]*\$");
    var regExLength = RegExp("^[A-Za-z ]{4,20}\$");
    final isValidString = regExString.hasMatch(value!);
    final isValidLength = regExLength.hasMatch(value);

    if (value.isNotEmpty) {
      if (!isValidString) {
        return "Please Enter Valid Last Name";
      }
      if (!isValidLength) {
        return "Last name must be at least 4 characters in length";
      }
    }
    return null;
  }

  String? validateId(String? value) {
    if (value!.isEmpty) {
      return "ID Number is required.";
    }
    if (value.length < 14) {
      return "ID Number must be of length 14.";
    }
    return null;
  }

  String? validateNationality(String? value) {
    if (value!.isEmpty) {
      return "Nationality is required.";
    }
    return null;
  }

  String? validateDob(String? value) {
    if (value!.isEmpty) {
      return "Date of birth is required.";
    }
    var inputFormat = DateFormat('dd-MM-yyyy');
    var date = inputFormat.parse(value);

    final today = DateTime.now();
    final difference = today.difference(date).inDays;

    if (difference / 360 < 18) {
      return "Must be above 18 years old.";
    }
    if (difference / 360 > 100) {
      return "Must be below 100 years old.";
    }

    return null;
  }
}

String capitalize(String input) {
  if (input == null) {
    throw new ArgumentError("string: $input");
  }
  if (input.length == 0) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}
