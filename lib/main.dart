import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/providers/auth_provider.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/screens/app/edit_farmer/edit_farmer_screen.dart';
import 'package:nirsal/screens/app/tabs/farmers/farmers_screen.dart';
import 'package:nirsal/screens/app/tabs/main_screen.dart';
import 'package:nirsal/screens/auth/fingerprint/fingerprint_screen.dart';
import 'package:nirsal/screens/auth/login/login_screen.dart';
import 'package:nirsal/screens/auth/otp/otp_screen.dart';
import 'package:nirsal/screens/splash/splash_screen.dart';
import 'package:nirsal/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
          title: 'NIRSAL',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            useMaterial3: true,
            scaffoldBackgroundColor: kWhiteColor,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.transparent
            ),
          ),
          initialRoute: Routes.splashRoute,
          routes: {
            Routes.splashRoute: (context) => const SplashScreen(),
            Routes.welcomeRoute: (context) => const WelcomeScreen(),
            Routes.loginRoute: (context) => const LoginScreen(),
            Routes.homeRoute: (context) => const MainScreen(),
            Routes.fingerPrintLoginRoute: (context) => const FingerPrintScreen(),
            Routes.otpRoute: (context) => const OtpScreen(),
            Routes.farmerEditRoute: (context) => const EditFarmerScreen(),
            Routes.farmers: (context) => const FarmerScreen(),
          },
        ),
      ),
    );
  }
}
