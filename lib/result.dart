import 'dart:ffi';

import 'package:flutter/material.dart';


class Result extends StatelessWidget{
  const Result({required this.IMG} );
  final double IMG;
  String inter_res(double IMG){
    String a;
    if(IMG<15){
    a="trop maigre";
    }else if(IMG>=15 && IMG<=30 ){
      a="normal";
    }else{
      a="trop graisse";
    }
   return a;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Column(children: [
        Container(margin:EdgeInsets.fromLTRB(90, 150, 80, 70),
          child: Text("YOUR RESULT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
        Container(margin:EdgeInsets.fromLTRB(70, 50, 70, 70),
            child: Text(inter_res(IMG),style:TextStyle(fontSize: 30,color: Colors.indigo[600]) ,),) ,
        Container(margin:EdgeInsets.fromLTRB(70, 50, 70, 70),
          child: Text(IMG.toString(),style:TextStyle(fontSize: 27,fontWeight: FontWeight.bold) ,),),
          Row(
            children: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("RECALCULATE"))],
          )

        ],),
      )
    );
  }

}