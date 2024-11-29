import 'dart:io';
import 'package:firbase_authatication/home_page.dart';
import 'package:firbase_authatication/login_signup_screen/login_page.dart';
import 'package:firbase_authatication/providers/navigate_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthProviders with ChangeNotifier {
  File? selectedImage;
  final auth = FirebaseAuth.instance;
  final signNing = GoogleSignIn();
  get user => auth.currentUser;
  bool isChecked = false;
  TextEditingController userName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  get context => null;

 Future<void> registerNow({required BuildContext context, required String userName, required dynamic  number, required String emailId,required String userPassword}) async{
   try{
        var newUser = await   auth.createUserWithEmailAndPassword(email: emailId, password: userPassword);

        NavigatePage.navigatePager(context, pageName: LoginPage());

        Fluttertoast.showToast(msg: "Register Success");
        clearController();


   }catch(e){
     Fluttertoast.showToast(msg:"Register failed $e");
   }
   }


 Future<void> loginNow({required BuildContext context, required String emailId, required String userPassword}) async{
   try{
   var user =  await auth.signInWithEmailAndPassword(email: emailId, password: userPassword);

 NavigatePage.navigatePager(context,pageName: HomePage());
 Fluttertoast.showToast(msg: "Login Success");
 clearController();

    } catch(e){
     Fluttertoast.showToast(msg: "login failed $e");

   }
   return;

 }
  void openGalleryImage(BuildContext context) async {
    final pickers = ImagePicker();
    final pickedFiles = await pickers.pickImage(source: ImageSource.gallery);
    if (pickedFiles != null) {
        selectedImage = File(pickedFiles.path);
    } else {
      print("Image not selected");
    }
  }
  void openCameraImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
    } else {
      print("Image not selected");
    }
  }

 void clearController(){
   userName.clear();
   emailId.clear();
   userPassword.clear();
   phoneNumber.clear();
 }


 Future<User?> googleSigning()async{

  final googleUser = await signNing.signIn();
  final googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
      idToken:googleAuth?.idToken ,
      accessToken: googleAuth?.accessToken);

  final userCredential = await auth.signInWithCredential(credential);
   return userCredential.user;


 }
  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  void logOut(BuildContext context) async {
  await auth.signOut();
  }

}