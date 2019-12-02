import 'package:calculatorfuel/widget/input.widget.dart';
import 'package:calculatorfuel/widget/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Text("Compensa utilizar álcool ?",
                style: TextStyle(
                  color:Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontFamily: "Big Shoulders Display"
                ),
                  
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.all(30),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(60),
                  
                  ),
                  child: FlatButton(
                    child: Text("CALCULAR NOVAMENTE",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontFamily: "Big Shoulders Display",
                      ),
                    ),
                    
                    onPressed: (){

                    },
                ),
                ),
                SizedBox(height: 20,)
              ],
              
            ),
          ),
          Input(
            ctrl: _gasCtrl,
            label: "Gasolina",
          ),
          Input(
            ctrl: _alcCtrl,
            label: "Alcool",
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: 60,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              child: Text("CALCULAR",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontFamily: "Big Shoulders Display",
                ),
              ),
              
              onPressed: (){

              },
          ),
          ),
        ],
      ),
      
    );
  }
}

