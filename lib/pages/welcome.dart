import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rive/rive.dart';
import 'package:social/constants/constants.dart';

import '../extensions/string.dart';
import '../widgets/layout/scaffold.dart';

class WelcomePage extends StatefulWidget {

  const WelcomePage(
    {
      super.key,
    }
  );

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

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
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 89,
            width: 352.7,
            child: RiveAnimation.asset(
              welcomeRiv,
              alignment: Alignment.centerLeft,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            AppLocalizations.of(context).welcome_intro,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)) ,
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: primary)
                )
              )
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(loginRoute);
            },
            child: Text(
              AppLocalizations.of(context).login.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)) ,
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.white)
                )
              )
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(registerRoute);
            },
            child: Text(
              AppLocalizations.of(context).register.capitalize(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
