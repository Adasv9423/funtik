import 'package:flutter/material.dart';
import 'package:funtik/constants.dart';
import 'package:funtik/views/widgets/screens/signup_screen.dart';
import 'package:funtik/views/widgets/text_input_field.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              Text('Login',
            style:TextStyle(fontSize:25,fontWeight: FontWeight.w300)),
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
                  controller: _passwordController,
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
                                onTap: () =>authController.loginUser( _emailController.text, _passwordController.text),
                                  
                                
                                 child: Text(
                                  'LOGIN',
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
                           InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => signupScreen(),
                    ),
                  ),child: Text('Don\'t have account ?',style: TextStyle(fontSize:20 ),)),
                                SizedBox(width: 10,),
                                InkWell(
                            onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => signupScreen(),
                    ),
                            ),
                    child: Text('Register',style: TextStyle(fontSize:20,color: buttonColor ),))
                           
                           
                          ,
          


          ])
                        
          ]             
        ) ,
      ),
    );
  }
}
