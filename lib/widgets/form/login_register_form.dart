import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../constants/constants.dart';
import '../../extensions/string.dart';
import '../layout/unauth/scaffold.dart';

class LoginRegisterForm extends StatefulWidget {
  final String text;
  final String btnText;

  const LoginRegisterForm(
    {
      super.key,
      required this.text,
      required this.btnText,
    }
  );

  @override
  State<LoginRegisterForm> createState() => _LoginRegisterFormState();
}

class _LoginRegisterFormState extends State<LoginRegisterForm> {

  bool _passwordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String? _mail;
  late String? _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _form() => Column(
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
      Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).mail.capitalize(),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? val) {
                _mail = val;
              },
              validator: (String? value) => emailRule(value, context),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).password.capitalize(),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 10),
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
              validator: (String? value) => passwordRule(value, context),
              onSaved: (String? val) {
                _password = val;
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)) ,
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                overlayColor: MaterialStateProperty.all(Colors.white12),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white)
                  )
                ),
              ),
              onPressed: () {
                final FormState form = _formKey.currentState!;
                if (form.validate()) {
                  form.save();
                  print(_mail);
                  print(_password);
                  _goToDashboardPage();
                }
              },
              child: Text(
                widget.btnText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
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
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: primary
                ),
                borderRadius: BorderRadius.circular(100)
              ),
              onPressed: () {
                _goToDashboardPage();
              },
              child: SvgPicture.asset(googleSvg, color: Colors.white, width: 30),
            ),
            const Spacer(),
            FloatingActionButton(
              heroTag: 'btnFingerProvider',
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: primary
                ),
                borderRadius: BorderRadius.circular(100)
              ),
              onPressed: () {
                _goToDashboardPage();
              },
              child: SvgPicture.asset(fingerPrintSvg, color: Colors.white, width: 30),
            ),
            const Spacer(),
            FloatingActionButton(
              heroTag: 'btnAppleProvider',
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: primary
                ),
                borderRadius: BorderRadius.circular(100)
              ),
              onPressed: () {
                _goToDashboardPage();
              },
              child: SvgPicture.asset(appleSvg, color: Colors.white, width: 30),
            ),
          ],
        ),
      )
    ],
  );

  void _goToDashboardPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      dashboardRoute,
      (Route<void> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) => UnAuthScaffold(
    resizeToAvoidBottomInset: false,
    body: _form()
  );
}
