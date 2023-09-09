import 'package:formz/formz.dart';

enum UsernameValidationError { empty, noValidationNumber, wrongCi }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    if (value.length == 7) return UsernameValidationError.noValidationNumber;
    if (value.length != 8) return UsernameValidationError.wrongCi;
    return null;
  }
}
