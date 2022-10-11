import 'package:flutter/material.dart';
import 'package:fresh_fruits/screens/auth/signin.dart';
import 'package:get/get.dart';

import '../../constants/firebase_constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _SigninState();
}

class _SigninState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign up here',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Enter your mail',
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        iconColor: Colors.blueAccent,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                          // hintStyle: txtcolor,
                          labelText: 'Password',
                          // labelStyle: txtcolor,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          iconColor: Colors.blueAccent,
                        ),
                        validator: (value) => value!.length < 6
                            ? 'Enter a password 6+ long'
                            : null,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = false;
                              });
                            }
                            dynamic result =
                                authController.register(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Could not sign up';
                                loading = false;
                              });
                            }
                          },
                          child: const Text("Sign up"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => const Signin());
                            },
                            child: const Text('Login'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
