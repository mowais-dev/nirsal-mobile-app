import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nirsal/providers/auth_provider.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';
import '../../../helpers/alert_helper.dart';
import '../../../models/objects.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordValidator = ValidationBuilder().minLength(2).required().build();

  final TextEditingController passwordController = TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        enableScroll: true,
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: 50.0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30.w,
              ),
          
              Image.asset(
                'assets/images/nirsal.png',
                width: 73.w,
              ),
          
              SizedBox(
                height: 80.w,
              ),
          
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(121.w / 2),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                    child: authProvider.authUser!.profilePhoto == null ? Image.asset(
                      'assets/images/avatar.png',
                      width: 121.w,
                      height: 121.w,
                      fit: BoxFit.cover,
                    ) : CachedNetworkImage(
                      imageUrl: authProvider.authUser!.profilePhoto!,
                      httpHeaders: const {
                        'Connection': 'Keep-Alive',
                      },
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 121.w,
                          height: 121.w,
                          color: kWhiteColor,
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                      width: 121.w,
                      height: 121.w,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              ),
          
              SizedBox(
                height: 21.w,
              ),
          
              Text(
                'Welcome ${Provider.of<AuthProvider>(context, listen: false).authUser!.fullName}',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
          
              SizedBox(
                height: 9.w,
              ),
          
              Text(
                'Please sign in',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
          
              Padding(
                padding: EdgeInsets.only(
                  top: 26.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: passwordController,
                      validator: passwordValidator,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: kInputEnabledBorder,
                        focusedBorder: kInputFocusedBorder,
                        errorBorder: kInputErrorBorder,
                        focusedErrorBorder: kInputErrorBorder,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: SvgPicture.asset(
                            'assets/icons/ic-lock.svg',
                            width: 20.w,
                          ),
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(
                          color: kLightPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        )
                      ),
                    ),
              
                    SizedBox(
                      height: 30.w,
                    ),
              
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return PrimaryButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              ResponseModel response = await authProvider.login(authProvider.authUser!.email, passwordController.text);

                              if (!context.mounted) { return; }

                              if (response.status == 'error') {
                                AlertHelper.showSnack(context, response.message, 'warning');
                                return;
                              }

                              Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
                            }
                          },
                          text: 'Sign In',
                          borderRadius: 17.w,
                          color: kYellowColor,
                          textColor: kBlackColor,
                          isLoading: authProvider.loading,
                        );
                      }
                    ),
              
                    SizedBox(
                      height: 24.w,
                    ),
              
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'sign in with ',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: kPrimaryColor,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'fingerprint',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    SizedBox(
                      height: 17.w,
                    ),
              
                    Center(
                      child: InkWell(
                        onTap: () async {
                          final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                          final bool deviceSupport = await auth.isDeviceSupported();

                          if (!context.mounted) { return; }

                          if (!canAuthenticateWithBiometrics || !deviceSupport) {
                            AlertHelper.showSnack(context, 'Biometric authentication not supported!', 'warning');
                            return;
                          }

                          final bool didAuthenticate = await auth.authenticate(
                            localizedReason: 'Please authenticate to login',
                            options: const AuthenticationOptions(biometricOnly: true)
                          );

                          if (!context.mounted) { return; }

                          if (didAuthenticate) {
                            Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/icons/ic-fingerprint.svg',
                        ),
                      ),
                    ),
              
                    SizedBox(
                      height: 12.w,
                    ),
              
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgotten username or password?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: kBlackColor,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(
                height: 42.w,
              ),
          
              Image.asset(
                'assets/images/armserv-bw.png',
                width: 85.w,
              ),
          
              SizedBox(
                height: 30.w,
              ),
          
              Image.asset(
                'assets/images/poweredby.png',
                width: 64.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}