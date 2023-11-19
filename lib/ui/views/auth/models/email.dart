import 'package:formz/formz.dart';

enum EmailValidationError { empty, noValidationNumber, wrongCi }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (value.length == 7) return EmailValidationError.noValidationNumber;
    if (value.length != 8) return EmailValidationError.wrongCi;

    return null;
  }
}
