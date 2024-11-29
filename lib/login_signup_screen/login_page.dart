import 'package:firbase_authatication/login_signup_screen/Register_page.dart';
import 'package:firbase_authatication/providers/auth_providder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProviders>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, top: 0),
                  child: Row(
                    children: [
                      Text(
                        "User Login",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0,
                                right: 0,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: provider.selectedImage ==
                                          null
                                      ? AssetImage(
                                          "assets/images/dextop_background_image.jpg")
                                      : FileImage(provider.selectedImage!),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: provider.emailId,
                                  cursorColor: Colors.blue,
                                  autocorrect: true,
                                  autofocus: true,
                                  showCursor: true,
                                  keyboardType: TextInputType.name,
                                  maxLength: 20,
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(Icons.email),
                                      hintText: "Enter Email Address",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                TextFormField(
                                  controller: provider.userPassword,
                                  cursorColor: Colors.blue,
                                  autocorrect: true,
                                  autofocus: true,
                                  showCursor: true,
                                  obscureText: true,
                                  keyboardType: TextInputType.numberWithOptions(decimal: provider.isChecked),
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.visibility_off),
                                      hintText: "Enter Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 180, top: 2),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Forgot Password")),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.pinkAccent)),
                                      onPressed: () {
                                        if (provider.user != null) {
                                          provider.loginNow(
                                              context: context,
                                              emailId: provider.emailId.text
                                                  .toString(),
                                              userPassword: provider
                                                  .userPassword.text
                                                  .toString());
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Invalid Email or Password");
                                        }
                                      },
                                      child: const Text(
                                        "User Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()));
                                          },
                                          child: const Text(
                                              "All Ready User Login?")),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
