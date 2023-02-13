import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:social/constants/constants.dart';

import '../../extensions/string.dart';
import '../layout/scaffold.dart';

class LoginRegisterForm extends StatefulWidget {
  final String text;

  const LoginRegisterForm(
    {
      super.key,
      required this.text,
    }
  );

  @override
  State<LoginRegisterForm> createState() => _LoginRegisterFormState();
}

class _LoginRegisterFormState extends State<LoginRegisterForm> {

  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SScaffold(
    resizeToAvoidBottomInset: false,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: SizedBox(
            height: 314 / 2,
            width: 314 / 2,
            child: RiveAnimation.asset(
              logoRiv,
              alignment: Alignment.centerLeft,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Text(widget.text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        const SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).mail.capitalize(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20,),
        TextFormField(
          obscureText: _passwordVisible,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).password.capitalize(),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          enableSuggestions: false,
          autocorrect: false,
        ),
        const SizedBox(height: 20,),
        Row(
          children: <Widget>[
            const Expanded(
              child: Divider(
                endIndent: 10,
                thickness: 1.5,
                color: Colors.white38,
              )
            ),
            Text(AppLocalizations.of(context).or.toUpperCase(), style: const TextStyle(color: Colors.white),),
            const Expanded(
              child: Divider(
                indent: 10,
                thickness: 1.5,
                color: Colors.white38,
              )
            ),
          ]
        ),
        const SizedBox(height: 20,),
        Theme(
          data: ThemeData(
            useMaterial3: false,
          ),
          child: Row(
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'btnGoogleProvider',
                backgroundColor: primary,
                onPressed: () {},
                child: SvgPicture.asset(google, color: Colors.white, width: 30),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: 'btnFingerProvider',
                backgroundColor: primary,
                onPressed: () {},
                child: SvgPicture.asset(fingerPrint, color: Colors.white, width: 30),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: 'btnAppleProvider',
                backgroundColor: primary,
                onPressed: () {},
                child: SvgPicture.asset(apple, color: Colors.white, width: 30),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
