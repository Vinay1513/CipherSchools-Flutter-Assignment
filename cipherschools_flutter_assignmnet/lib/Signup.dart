import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool? _isChecked = false;
  bool _obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      height: double.infinity,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Container(
            height: 64,
            width: 500,
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back,
                ),
                SizedBox(
                  width: 150,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 56,
                        width: 343,
                        child: TextFormField(
                          controller: userNameTextEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(241, 241, 250, 1),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: "Name",
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(241, 241, 250, 1)),
                          ),
                          validator: (value) {
                            print("In USERNAME VALIDATOR");
                            if (value == null || value.isEmpty) {
                              return "please enter username";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        width: 343,
                        child: TextFormField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(241, 241, 250, 1),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(241, 241, 250, 1)),
                          ),
                          validator: (value) {
                            print("In Email VALIDATOR");
                            if (value == null || value.isEmpty) {
                              return "please enter email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        width: 343,
                        child: TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(241, 241, 250, 1)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(241, 241, 250, 1),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked!;
                              });
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                    width: 4.0,
                                    color:
                                        const Color.fromRGBO(127, 61, 255, 1)),
                                color: _isChecked!
                                    ? const Color.fromRGBO(127, 61, 255, 1)
                                    : Colors.transparent,
                              ),
                              child: _isChecked!
                                  ? const Icon(
                                      Icons.check,
                                      size: 18.0,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 36,
                            width: 300,
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'By signing up, you agree to the ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of Service and Privacy Policy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(127, 61, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(127, 61, 255, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 56,
                            width: 343,
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 136),
                          child: Container(
                            height: 18,
                            width: 100,
                            child: Center(
                              child: Text('or with',
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          145, 145, 159, 1))),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            )),
                        child: Image.asset('assets/images/google.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 64.0),
                        child: Container(
                          height: 19,
                          width: 243,
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Already have an account? ',
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(127, 61, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ]),
    ));
  }
}
