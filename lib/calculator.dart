import 'package:flutter/material.dart';
import 'package:checkmyhealth/result.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  State<Calculator> createState() {
      return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator>{
  int height=150;
  String sex="";
  Color FemaleCard=Colors.cyan;
  Color MaleCard=Colors.cyan;
  int weight=60;
  int Age=18;
  double IMG=0;
  int s=0;
  double calcul_img (int poids , int taille , int age , String sex){
     int s=0;
     double IMG=0;
     if(sex=="Female"){
       s=1;
     }
     IMG = (1.2*poids/((taille*0.01)*(taille*0.01)))+(0.23*age)-(10.83*s)-5.4;
     return IMG;
  }
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("check my health")),
       body: Column(children: [
         Expanded(
       child:Row(
       children:[
         Expanded(
           child: InkWell(onTap: (){setState(() {
           sex="female";
           FemaleCard=Colors.redAccent;
           s=0;
         });},
         child: Card(color:FemaleCard,
         child: Column(children: [
           Icon(Icons.female),
           SizedBox(height: 30),
           Text("female")
         ],),),
         )),
       Expanded(
         child: InkWell(
         onTap: (){setState(() {
           sex="male";
           MaleCard=Colors.teal;
           s=1;
         });},
         child: Card(color: MaleCard,
         child: Column(children: [
           Icon(Icons.male),
           SizedBox(height: 30),
           Text("male")
         ])),
       ))
       ],
       ),
       ),
       Expanded(child:
       Row(children: [
        Expanded(child:
        Card(child:
        Column(children: [Text("Height"),
        Row(children: [Text(height.toString()),Text("cm")],
        ),

        SliderTheme(
          data:SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0,),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 50.0),
          thumbColor: Color.fromARGB(255, 9, 44, 61),
          overlayColor: Color.fromARGB(255, 176, 237, 251),
          activeTrackColor: Colors.redAccent,
          inactiveTickMarkColor: Color(0xFF8D8E98),
            ),
          child: Slider(
            value: 150,
            min: 55,
            max:250,
            onChanged: (double val){
              setState(() {
                height=val.toInt();
              });
            },
          ),
        ),
        
        ],)))
       ],)),
       Expanded(child: 
       Row(
         children: [
           Expanded(child: Row(
             children: [Expanded(child: Card(child:
             Column(children:
             [Text("Weight"),
               Row(children: [IconButton(onPressed:(){setState(() {weight--;});},
                   icon: Icon( Icons.remove_circle)),Text(weight.toString()),
                 IconButton(onPressed:(){setState(() {weight++;});},
                     icon: Icon( Icons.add_circle))],)],),)),

               Expanded(child: 
               Card(child: 
                 Column(children: [Text("age"),
                   Row(children: [IconButton(onPressed: (){
                     setState(() {
                       Age--;
                     });
                   }, 
                       icon: Icon(Icons.remove_circle)),
                   Text(Age.toString()),
                     IconButton(onPressed:(){
                       setState(() {
                         Age++;
                       });
                     }, icon: Icon(Icons.add_circle)),
                   ],)],)
                 ,)
               ),
             ],
           )),
           Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [ElevatedButton(onPressed:(){IMG=calcul_img(weight, height,Age, sex);
             Navigator.push(context, MaterialPageRoute(builder:(builder)=>Result(IMG:IMG,)));}, child: Text("CALCULATE"))],))
         ],

       )
       )
       ],),);

   }
}
