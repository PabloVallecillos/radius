import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extensions/string.dart';
import '../widgets/form/login_register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage(
    {
      super.key
    }
  );

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    text: AppLocalizations.of(context).register.capitalize()
  );
}
