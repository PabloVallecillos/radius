import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extensions/string.dart';
import '../widgets/form/login_register_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
    {
      super.key
    }
  );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LoginRegisterForm(
    text: AppLocalizations.of(context).login.capitalize()
  );
}
