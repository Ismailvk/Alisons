import 'package:allison/resources/app_urls/image_urls.dart';
import 'package:allison/resources/components/button.dart';
import 'package:allison/resources/components/textfield.dart';
import 'package:allison/utils/validation.dart';
import 'package:allison/view/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  String gender = 'Male'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageUrls.signupImage),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.width * 0.05),
              TextFormFieldWid(
                  pIcon: Icons.email,
                  isSufix: false,
                  validator: (value) => Validation.isEmail(value),
                  controller: nameController,
                  hintText: 'Full Name',
                  obscureText: false),
              SizedBox(height: size.width * 0.05),
              TextFormFieldWid(
                pIcon: Icons.lock,
                isSufix: true,
                validator: (value) => Validation.isPassword(value),
                controller: nameController,
                hintText: 'Phone Number',
                obscureText: false,
              ),
              SizedBox(height: size.width * 0.05),
              TextFormFieldWid(
                pIcon: Icons.lock,
                isSufix: true,
                validator: (value) => Validation.isPassword(value),
                controller: nameController,
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(height: size.width * 0.05),
              TextFormFieldWid(
                pIcon: Icons.lock,
                isSufix: true,
                validator: (value) => Validation.isPassword(value),
                controller: nameController,
                hintText: 'Password',
                obscureText: false,
              ),
              SizedBox(height: size.width * 0.03),
              Text(
                'Password must contain 6 characters, at least one Upper case and one Lower case',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.white,
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text('Male', style: TextStyle(color: Colors.white)),
                  Radio<String>(
                    activeColor: Colors.white,
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text('Female', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: size.width * 0.13),
              AnimatedClickableTextContainer(
                  iconSrc: '',
                  title: 'Signup',
                  press: () {
                    // Handle signup action here
                  },
                  bgColor: Colors.white),
              SizedBox(height: size.width * 0.05),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account ? ",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Login",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.white),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
