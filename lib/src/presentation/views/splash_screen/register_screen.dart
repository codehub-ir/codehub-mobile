import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/constant/app_styles/app_styles.dart';
import 'package:codehub/src/presentation/widgets/custom_auth_widget.dart';
import 'package:codehub/src/presentation/widgets/custom_checkbox.dart';
import 'package:codehub/src/presentation/widgets/custom_gradient_button.dart';
import 'package:codehub/utils/size_config/size_config.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  sizedBox(h) => SizedBox(
        height: h,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      registerTitle,
                      style: titleBoldStyle,
                    ),
                    sizedBox(SizeConfig.heightMultiplier * 2),
                    customAuthWidget(),
                  ],
                ),
                sizedBox(SizeConfig.heightMultiplier * 13),
                Form(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: emailHint,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      sizedBox(SizeConfig.heightMultiplier * 2),
                      Container(
                        decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            hintText: pwdHint,
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: togglePassword,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      sizedBox(SizeConfig.heightMultiplier * 2),
                      Container(
                        decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          obscureText: !passwordConfrimationVisible,
                          decoration: InputDecoration(
                            hintText: confirmPwdHint,
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordConfrimationVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  passwordConfrimationVisible =
                                      !passwordConfrimationVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox(SizeConfig.heightMultiplier * 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomCheckbox(),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      termsAndConditions,
                      style: underlineBoldStyle,
                    ),
                  ],
                ),
                sizedBox(SizeConfig.heightMultiplier * 6),
                Center(
                  child: CustomGradientButton(
                    onPressed: () {},
                    child: Text(registerBtn),
                    width: 250,
                    height: 50,
                    borderRadius: 20,
                    colors: [primaryColor, primaryColor.withOpacity(.2)],
                  ),
                ),
                sizedBox(SizeConfig.heightMultiplier * 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        haveAccount + " ",
                      ),
                      Text(
                        loginBtn,
                        style: underlineBoldStyle.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
