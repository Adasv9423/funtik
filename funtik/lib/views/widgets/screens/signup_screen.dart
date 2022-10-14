import 'package:flutter/material.dart';
import 'package:funtik/constants.dart';
import 'package:funtik/controllers/auth_controller.dart';
import 'package:funtik/views/widgets/screens/login_screen.dart';
import 'package:funtik/views/widgets/text_input_field.dart';


class signupScreen extends StatelessWidget {
  
   signupScreen({Key? key}) : super(key: key);
  
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var buttonColor2 = buttonColor;
    return Scaffold(
      body:Container(
        
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('FUNTIK',
            style:TextStyle(fontSize:35,color:buttonColor,fontWeight: FontWeight.w500)),
              Text('Register',
            style:TextStyle(fontSize:25,fontWeight: FontWeight.w300)),
            SizedBox(height:25),
                Stack(
              // children: [
              //   const CircleAvatar(
              //     radius: 64,
              //     backgroundImage: NetworkImage(
              //         'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
              //     backgroundColor: Colors.black,
              //   ),
              //   Positioned(
              //     bottom: -10,
              //     left: 80,
              //     child: IconButton(
              //         onPressed: ()=>
              //        authController.pickImage(),
                                  
             
              //       icon: const Icon(
              //         Icons.add_a_photo,
              //       ),
              //     ),
              //   ),
              // ],
            ),
            const SizedBox(
              height: 15,
            ),

             Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:TextinputField(
                  controller:  _usernameController,
                  labelText: 'Username',
                  icon:Icons.person,

              ),
            ),
             SizedBox(height:25),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:TextinputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon:Icons.email,

              ),
            ),
             SizedBox(height:25),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:TextinputField(
                  controller:  _passwordController,
                  labelText: 'Password',
                  icon:Icons.lock,
                  isObscure: true,

              ),
            ),
             SizedBox(height:30),
             Container(
                            width: 140,
                            height: 47,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.blue,
                              ),
                               color:Colors.blue,
                            ),
             child: Center(
                              child: InkWell(
                                onTap: () => authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                //  authController.profilePhoto,
                ),
                                
                                 child: Text(
                                  'Register',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                                 InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),child: Text('Login',style: TextStyle(fontSize:20,color: buttonColor ),))
                           
                           
                          ,
          


          ])
                        
          ]             
        ) ,
      ),
    );
  }
}
