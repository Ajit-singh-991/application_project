// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, use_build_context_synchronously

import 'package:application_project/pages/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegNav extends StatefulWidget {
  const RegNav({super.key});

  @override
  State<RegNav> createState() => _RegNavState();
}

class _RegNavState extends State<RegNav> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  late SharedPreferences logindata;
  late bool _obsecureText = true;
  late bool _obsecureText2 = true;
  late bool newuser;
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  void initState() {
    super.initState();
    check_if_already_logged_in();
    emailController;
    passwordController;
    nameController;
    confirmpasswordController;
    InternationalPhoneNumberInput(onInputChanged: (value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter Name");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter Valid Name upto 3 characters");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nameController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Colors.purple,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Name",
                        border: OutlineInputBorder(
                          gapPadding: 4.0,
                          borderSide: const BorderSide(
                              color: Colors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        if (!RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value)) {
                          return ("Please Enter Your Valid Email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail_lock_rounded,
                          color: Colors.purple,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            cursorColor: Colors.purple[600],
                            inputDecoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Phone number",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: addressController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter address");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter Valid address upto 3 characters");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.add_home_work_rounded,
                          color: Colors.purple,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Address",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: _obsecureText,
                      autofocus: false,
                      controller: passwordController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter Password");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter Valid Password upto 6 characters");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                          child: Icon(_obsecureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(
                          Icons.vpn_key_off_rounded,
                          color: Colors.purple,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: _obsecureText2,
                      autofocus: false,
                      controller: confirmpasswordController,
                      validator: (value) {
                        if (confirmpasswordController.text !=
                            passwordController.text) {
                          return " Please Enter the correct password";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmpasswordController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText2 = !_obsecureText2;
                            });
                          },
                          child: Icon(_obsecureText2
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(
                          Icons.vpn_key_off_rounded,
                          color: Colors.purple,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Confirm Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.purple, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            String email = emailController.text;
                            String password = passwordController.text;

                            if (email != '' && password != '') {
                              print('login sucessful');

                              logindata.setBool('login', false);
                              logindata.setString('email', email);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LandingPage()),
                                  (route) => false);
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ))
    ]);
  }

  void check_if_already_logged_in() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
