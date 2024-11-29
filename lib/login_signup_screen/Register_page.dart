import 'package:firbase_authatication/home_page.dart';
import 'package:firbase_authatication/login_signup_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../providers/auth_providder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _providers = AuthProviders();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProviders>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, top: 0),
                  child: Row(
                    children: [
                      Text(
                        "Registration",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0,
                              right: 0,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: provider.selectedImage == null
                                    ? const AssetImage(
                                        "assets/images/dextop_background_image.jpg")
                                    : FileImage(provider.selectedImage!),
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Select Image Picaker",
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.white70),
                                            ),
                                            backgroundColor:
                                                Colors.pinkAccent.shade100,
                                            actions: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        "Select Photo to Gallery",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            provider
                                                                .openGalleryImage(
                                                                    context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(
                                                            Icons.insert_photo,
                                                            size: 30,
                                                            color:
                                                                Colors.white70,
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        "Action Camera to Device",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            provider
                                                                .openCameraImage(
                                                                    context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(
                                                            Icons
                                                                .camera_enhance_sharp,
                                                            size: 30,
                                                            color:
                                                                Colors.white70,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                            iconColor: Colors.green,
                                          );
                                        },
                                      );
                                    },
                                    icon: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 65, top: 50),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: provider.userName,
                                cursorColor: Colors.blue,
                                autocorrect: true,
                                autofocus: true,
                                showCursor: true,
                                keyboardType: TextInputType.name,
                                maxLength: 20,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.person),
                                    hintText: "Enter Name",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
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
                                    suffixIcon: Icon(Icons.email),
                                    hintText: "Enter Email Address",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              TextFormField(
                                controller: provider.phoneNumber,
                                cursorColor: Colors.blue,
                                autofillHints: Set(),
                                autocorrect: true,
                                autofocus: true,
                                showCursor: true,
                                keyboardType: TextInputType.phone,
                                maxLength: 12,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.phone),
                                    hintText: "Enter Phone Number",
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
                                keyboardType: TextInputType.visiblePassword,
                                maxLength: 8,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.visibility),
                                    hintText: "Enter Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.pinkAccent)),
                                    onPressed: () {
                                      var name =
                                          provider.userName.text.toString();
                                      var email =
                                          provider.emailId.text.toString();
                                      var number =
                                          provider.phoneNumber.text.toString();
                                      var password =
                                          provider.userPassword.text.toString();
                                      var image =
                                          provider.selectedImage.toString();
                                      if (name.isNotEmpty &&
                                          email.isNotEmpty &&
                                          number.isNotEmpty &&
                                          password.isNotEmpty &&
                                          image.isNotEmpty) {
                                        provider.registerNow(
                                          context: context,
                                          userName: name,
                                          number: number,
                                          emailId: email,
                                          userPassword: password,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "please fill in all blanks");
                                      }
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(height: 5,),
                              SignInButton(
                                  Buttons.google,
                                  onPressed:(){
                                    googleRegisterNow();
                              }),
                              SizedBox(height: 5,),
                              TextButton(onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              }, child: Text("Already register"))
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }

  void googleRegisterNow()async{
    final user = await  _providers.googleSigning();
    if(user != null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }
}
