import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:checkmyhealth/calculator.dart';

class Welcome extends StatelessWidget{
  const Welcome({super.key});
  Widget build(BuildContext context) {

    return SplashScreen(seconds:10,navigateAfterSeconds: new Calculator(),
      title: new Text('Check My Health',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      image: new Image.asset('images/logo.png'),
      backgroundColor:Colors.cyan[100],loadingText:
      Text("loading",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent ),),
      photoSize: 100,loaderColor: Colors.indigo[400],);

  }


}