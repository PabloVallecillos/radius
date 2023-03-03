import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extensions/string.dart';

/// validation rules
String? emailRule(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context).is_required(
        AppLocalizations.of(context).mail.capitalize(),
        AppLocalizations.of(context).required_male
    );
  }
  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
    return AppLocalizations.of(context).incorrect(
        AppLocalizations.of(context).mail.capitalize()
    );
  }
  return null;
}
const int passwordLength = 8;

String? passwordRule(String? value, BuildContext context) {
  if (value != null) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).is_required(
          AppLocalizations.of(context).password.capitalize(),
          AppLocalizations.of(context).required_female
      );
    }
    if (value.length < passwordLength) {
      return AppLocalizations.of(context).password_length(
          passwordLength.toString()
      );
    }
  }
  return null;
}
