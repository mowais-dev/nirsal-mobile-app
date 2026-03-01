import 'package:flutter/material.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/helpers/preference_helper.dart';
import 'package:nirsal/routes.dart';
import 'package:provider/provider.dart';

import '../../models/objects.dart';
import '../../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      validateAccess();
    });

    super.initState();
  }

  void validateAccess() async {
    String token = await PreferenceHelper().getAccessToken();
    UserModel? authUser = await PreferenceHelper().getAuthUser();

    if (token != '' && authUser != null) {

      if (!mounted) { return; }

      Provider.of<AuthProvider>(context, listen: false).authUser = authUser;
      Navigator.pushNamedAndRemoveUntil(context, Routes.fingerPrintLoginRoute, (route) => false);
      return;
    }

    if (!mounted) { return; }

    Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: kYellowColor,
        ),
      ),
    );
  }
}