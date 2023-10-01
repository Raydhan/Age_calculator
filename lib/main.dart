import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AGE(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class AGE extends StatefulWidget {
  const AGE({super.key});

  @override
  State<AGE> createState() => _AGEState();
}

class _AGEState extends State<AGE> {
  String myAge = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("Age Calculator",),centerTitle: true,),
    body: Center(child:
                      Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Your Age is",style: TextStyle(fontSize: 40,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),),
                              SizedBox(height: 20,),
                              Text(myAge),
                              SizedBox(height: 40,),
                              ElevatedButton(
                                  onPressed: () =>  pickDop(),
                                  child: Text("Pick Your Date of Birth")
                              )

                            ],),),
    ));
  }

  pickDop() 
  {
    
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1935), lastDate: DateTime.now()).then((pickedDate) {

    if( pickedDate != null )
    {
      calculateAge(pickedDate);
    }
    },);
    
  }
  calculateAge(DateTime birth)
  {

    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365 ) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    setState(() {
      myAge = "$years years, $months months, $days days";
    });

  }
}
