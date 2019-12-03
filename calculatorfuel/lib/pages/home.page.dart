import 'package:calculatorfuel/widget/logo.widget.dart';
import 'package:calculatorfuel/widget/submit-form.dart';
import 'package:calculatorfuel/widget/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var busy = false;
  var completed = false;
  var resultText =  "Compensa utilizar álcool";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
        children: <Widget>[
          Logo(),
          completed 
              ? Success(
                result : resultText,
                reset: reset,

                )
              : SubmitForm(
                alcCtrl: _alcCtrl,
                gasCtrl: _gasCtrl,
                submitFunc: calculate,
                busy: busy,
                ),
        ],
      ),
      )
      
    );
  }

  Future calculate(){
    double alc = double.parse(
      _alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')
    ) / 100;
    double gas = double.parse(
      _gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')
    ) / 100;

    double res = alc / gas;
  

    setState(() {
      _color = Colors.deepPurpleAccent;
      completed = false;
      busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1),
    (){
      setState(() {
        if(res >= 0.7){
        resultText = "Compensa utilizar Gasolina!";
        }else{
          resultText = "Compensa utilizar Álcool!";
        }

        busy = false;
        completed = true;

      });
    });

    

    
    
  }

  reset(){
      setState(() {
        _gasCtrl = new MoneyMaskedTextController();
        _alcCtrl = new MoneyMaskedTextController();
        completed = false;
        busy = false;
        _color = Colors.deepPurple;
      });
    }
}
