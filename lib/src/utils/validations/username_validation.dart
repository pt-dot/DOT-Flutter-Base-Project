import 'package:formz/formz.dart';

class Username extends FormzInput<String, String> {

  const Username.pure(): super.pure('');
  const Username.dirty([String value = '']): super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Field is Empty';
    } else if (value.length > 256) {
      return 'Input Value is Too Long';
    } else {
      return null;
    }
  }

}