class Validator {
  Validator();
  String? notEmpty(String? value, String title) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Nhập $title';
    } else {
      return null;
    }
  }

  String? isNumericAndNotEmpty(String? value, String title) {
    String pattern = r'^\d+$'; // Chỉ cho phép các ký tự số
    RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Nhập $title';
    } else if (!regex.hasMatch(value)) {
      return '$title should only contain numbers';
    } else {
      return null;
    }
  }
}
