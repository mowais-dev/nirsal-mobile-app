import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:nirsal/helpers/alert_helper.dart';
import 'package:nirsal/models/objects.dart';
import 'package:nirsal/providers/auth_provider.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../widgets/forget_password_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final formKey = GlobalKey<FormState>();
  final emailValidator = ValidationBuilder().email('Please enter valid email address').required().build();
  final passwordValidator = ValidationBuilder().minLength(2).required().build();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
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
          
              Image.asset(
                'assets/images/armserv.png',
                width: 143.w,
              ),
          
              Stack(
                children: [
                  Image.asset(
                    'assets/images/blurbg.png',
                    width: double.infinity,
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(
                      top: 55.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16.sp,
                          ),
                        ),
          
                        SizedBox(
                          height: 30.w,
                        ),
          
                        TextFormField(
                          controller: emailController,
                          validator: emailValidator,
                          decoration: InputDecoration(
                            enabledBorder: kInputEnabledBorder,
                            focusedBorder: kInputFocusedBorder,
                            errorBorder: kInputErrorBorder,
                            focusedErrorBorder: kInputErrorBorder,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15.w),
                              child: SvgPicture.asset(
                                'assets/icons/ic-user.svg',
                                width: 20.w,
                              ),
                            ),
                            hintText: 'email',
                            hintStyle: TextStyle(
                              color: kLightPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            )
                          ),
                        ),
          
                        SizedBox(
                          height: 20.w,
                        ),
          
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: passwordValidator,
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
                            ),
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
                                  ResponseModel response = await authProvider.login(emailController.text, passwordController.text);

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
          
                        // Center(
                        //   child: Text.rich(
                        //     TextSpan(
                        //       text: 'sign in with ',
                        //       style: TextStyle(
                        //         fontSize: 17.sp,
                        //         color: kPrimaryColor,
                        //       ),
                        //       children: <InlineSpan>[
                        //         TextSpan(
                        //           text: 'fingerprint',
                        //           style: TextStyle(
                        //             fontSize: 17.sp,
                        //             fontWeight: FontWeight.bold,
                        //             color: kPrimaryColor,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
          
                        // SizedBox(
                        //   height: 17.w,
                        // ),
          
                        // Center(
                        //   child: InkWell(
                        //     onTap: () {
                        //       Navigator.pushNamed(context, Routes.fingerPrintLoginRoute);
                        //     },
                        //     child: SvgPicture.asset(
                        //       'assets/icons/ic-fingerprint.svg',
                        //     ),
                        //   ),
                        // ),
          
                        SizedBox(
                          height: 12.w,
                        ),
          
                        Center(
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return const ForgetPasswordModal();
                                }
                              );
                            },
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
                ],
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