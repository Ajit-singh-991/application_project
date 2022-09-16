import 'dart:io';

import 'package:application_project/pages/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late SharedPreferences logindata;
  String finalName = "";
  String finalEmail = "";
  String finalAddress = "";
  var imagepicked;
  File? image;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  late bool newuser;
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  void initState() {
    super.initState();
    emailController;
    passwordController;
    nameController;
    confirmpasswordController;
    InternationalPhoneNumberInput(onInputChanged: (value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: image != null
                                  ? FileImage(image!) as ImageProvider
                                  : const AssetImage(
                                      'assets/images/login_image.png'),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()),
                                  );
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
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
                      border: OutlineInputBorder(
                        gapPadding: 4.0,
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
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      border: OutlineInputBorder(
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
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Address",
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          String name = nameController.text;
                          String email = emailController.text;
                          String address = addressController.text;

                          if (email != '') {
                            print('Saved sucessfully');

                            logindata.setBool('login', true);
                            logindata.setString('email', email);
                            logindata.setString('name', name);
                            logindata.setString('address', address);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LandingPage()),
                                (route) => false);
                          }
                        });
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.purple,
                        letterSpacing: 2.2,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void getValidationData() async {
    logindata = await SharedPreferences.getInstance();

    setState(() {
      finalEmail = logindata.getString('email')!;
      finalName = logindata.getString('name')!;
      finalAddress = logindata.getString('address')!;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Select a Profile Image",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => pickImage(ImageSource.camera),
                icon: const Icon(
                  Icons.camera,
                  size: 50,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: () => pickImage(ImageSource.gallery),
                icon: const Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to load image:$e');
    }
  }

  TextFormField buildTextField(String lablel, String placeHolder) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 3, right: 3),
        labelText: lablel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1,
          decorationStyle: TextDecorationStyle.dashed,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
