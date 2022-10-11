import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/firebase_constant.dart';
import 'register.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Sign In'),
      //     centerTitle: true,
      //     elevation: 0,
      //     automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign in here',
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
                        validator: (value) =>
                            value!.isEmpty ? 'Enter Email' : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Enter your mail',
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          iconColor: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          validator: (value) => value!.length < 6
                              ? 'Enter a password 6+ long'
                              : null,
                          obscureText: true,
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
                                  authController.login(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Could not sign in';
                                  loading = false;
                                });
                              }
                            },
                            child: const Text("Login"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => const Register());
                              },
                              child:const Text('Sign Up')),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
