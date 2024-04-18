import 'package:fpdart/fpdart.dart';
import 'package:word_game/constants/word_list.dart';

import '../constants/regexps.dart';
import '../core/models/value_failure/value_failure.dart';

//TODO: MİN PASSWORD MUST HAVE 8 OF LENGTH
const minPasswordLength = 8;

Option<ValueFailure> validateEmptiness(String input, {String? customMessage}) {
  if (input.isEmpty) {
    return some(ValueFailure.invalidInput(customMessage ?? 'Bir değer giriniz.'));
  }

  return none();
}

Option<ValueFailure> validateEmptinessMaxCharacter(
  String input, {
  String? customMessage,
  int maxCharacter = 100,
  String? maxMessage,
}) {
  if (input.isEmpty) {
    return some(ValueFailure.invalidInput(customMessage ?? 'Bir değer giriniz.'));
  }

  if (input.length > maxCharacter) {
    return some(ValueFailure.invalidInput(maxMessage ?? 'En fazla $maxCharacter karakter girebilirsiniz.'));
  }

  return none();
}

Option<ValueFailure> validateUserName(String? input) {
  if (input == '' || input == null) return some(const ValueFailure.invalidInput('Kullanıcı adı boş olamaz.'));

  if (input.length < 5) {
    return some(const ValueFailure.invalidInput('Kullanıcı adı en az 5 karakter olmalıdır.'));
  }

  if (!alphanumericRegexp.hasMatch(input)) {
    return some(const ValueFailure.invalidInput('Kullanıcı adı alfanümerik olmalıdır.'));
  }

  return none();
}

Option<ValueFailure> validatePassword(String? input) {
  if (input == '' || input == null) return some(const ValueFailure.invalidInput('Şifre boş olamaz.'));

  if (input.length < minPasswordLength) {
    return some(const ValueFailure.invalidInput('Şifre en az $minPasswordLength karakter olmalıdır.'));
  }

  if (!alphanumericRegexp.hasMatch(input)) {
    // return some(const ValueFailure.invalidInput('Şifre alfanümerik olmalıdır.'));
  }

  return none();
}

Option<ValueFailure> validateWord(String input, int length) {
  if (input.length != length) {
    return some(ValueFailure.invalidInput('Kelime $length karakter olmalıdır.'));
  } else if (!wordList.contains(input.replaceAll('I', 'ı').replaceAll('İ', 'i').toLowerCase())) {
    return some(const ValueFailure.invalidInput('Geçerli bir kelime giriniz.'));
  }

  return none();
}


// String? validateDropDownValue(dynamic value) {
//   if (value == null) {
//     return emptyInputFailureMessage;
//   }
//   return null;
// }
