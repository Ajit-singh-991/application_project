// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, sort_child_properties_last, prefer_initializing_formals, non_constant_identifier_names

import 'package:application_project/registration_pages/regnav.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  //final TextEditingController mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late SharedPreferences logindata;

  late bool newuser;
  late bool _obsecureText = true;
  late bool _obsecureText2 = true;

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
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(20)),
              const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/login_image.png')),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'REGISTER YOURSELF',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
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
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Name",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2.0),
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
                onSaved: (value) {
                  emailController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail_lock_rounded,
                    color: Colors.purple,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputValidated: (value) {
                        RegExp regex = RegExp(r'^.{10,}$');
                        // if (value.isEmpty) {
                        //   return ("Please Enter Mobile Number");
                        // }
                        // if (!regex.hasMatch(value)) {
                        //   return ("Please Enter Valid Number upto 10 characters");
                        // }
                        // return null;
                      },

                      // validator: (value) {
                      //
                      // },
                      onInputChanged: (value) {},

                      cursorColor: Colors.purple[600],
                      inputDecoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Phone number",
                        focusedBorder: OutlineInputBorder(
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
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Address",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2.0),
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
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2.0),
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
                    return "Password does not match";
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
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Confirm Password",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2.0),
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
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (email != '' && password != '') {
                    print('login sucessful');
                    const SnackBar(content: Text('Login Sucessful'));
                    logindata.setBool('login', false);
                    logindata.setString('email', email);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const RegNav()),
                        (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
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
      ]),
    );
  }

  void check_if_already_logged_in() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    // ignore: avoid_print
    print(newuser);
    if (newuser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const RegNav()),
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
