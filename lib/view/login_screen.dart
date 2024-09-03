import 'package:allison/controller/bloc/login_bloc.dart';
import 'package:allison/resources/app_urls/image_urls.dart';
import 'package:allison/resources/components/button.dart';
import 'package:allison/resources/components/textfield.dart';
import 'package:allison/utils/snackbar.dart';
import 'package:allison/utils/validation.dart';
import 'package:allison/view/home.dart';
import 'package:allison/view/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageUrls.loginImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.width * 0.05),
                TextFormFieldWid(
                    pIcon: Icons.email,
                    isSufix: false,
                    validator: (value) =>
                        Validation.isEmpty(value, 'Phone Number'),
                    controller: phoneController,
                    hintText: 'Email Phone Number',
                    obscureText: false),
                SizedBox(height: size.width * 0.05),
                TextFormFieldWid(
                  pIcon: Icons.lock,
                  isSufix: true,
                  validator: (value) => Validation.isPassword(value),
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                SizedBox(height: size.width * 0.13),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      topSnackbar(context, state.message, Colors.red);
                    } else if (state is LoginSuccessState) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return AnimatedClickableTextContainer(
                        iconSrc: '',
                        title: 'Login',
                        press: () {
                          if (loginKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginUserEvent(
                                phone: phoneController.text,
                                password: passwordController.text));
                          }
                        },
                        bgColor: Colors.white);
                  },
                ),
                SizedBox(height: size.width * 0.05),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account ? ",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Signup",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: Colors.white),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
