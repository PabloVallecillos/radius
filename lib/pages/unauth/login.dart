import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../extensions/string.dart';
import '../../widgets/form/login_register_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) => LoginRegisterForm(
    text: AppLocalizations.of(context).login.capitalize(),
    btnText: AppLocalizations.of(context).enter.capitalize(),
  );
}
