import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {

  const Password.pure(): super.pure('');
  const Password.dirty([String value = '']): super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Password is Empty';
    } else if (value.length < 6) {
      return 'Password Min 6 character';
    } else {
      return null;
    }
  }

}