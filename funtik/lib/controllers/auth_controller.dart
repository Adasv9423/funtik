
import 'dart:io' as i;
import 'package:funtik/views/widgets/screens/login_screen.dart';
 import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:funtik/model/user.dart' as model;
import 'package:image_picker/image_picker.dart';
import '../constants.dart';
import '../views/widgets/screens/home_screen.dart';

class AuthController extends GetxController{
   // ignore: non_constant_identifier_names
     static AuthController instance = Get.find();
     late Rx<User?> _user;
   Rx<XFile?>? _pickedImage;
     @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }


 // XFile? get profilePhoto => _pickedImage?.value;
  User get user => _user.value!;
     void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
     _pickedImage = XFile(pickedImage!.path) as Rx<XFile?>;
  }
   Future<String> _uploadToStorage(XFile image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    i.File file = i.File(image.path);
    UploadTask uploadTask = ref.putFile(file);
    
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // registering the user
  void registerUser(
      String username, String email, String password,
     /*  XFile? image*/) async
       {
    try {
      
       
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty 
    ) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // String downloadUrl = await _uploadToStorage(image!);
         model.User user = model.User(
           name: username,
          email: email,
           uid: cred.user!.uid,
        //   profilePhoto: downloadUrl,
         );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
           .set(user.ToString());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }
   void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
            print('log success');
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }
  void signOut() async {
    await firebaseAuth.signOut();
  }


 }