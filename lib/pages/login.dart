import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extensions/string.dart';
import '../widgets/layout/scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) => SScaffold(
    body: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).user.capitalize(),
          ),
        ),
        const SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).password.capitalize()
          ),
        ),
      ],
    )
  );
}
