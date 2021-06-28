import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: calculator(),
      ),
      
    );
  }
}

class calculator extends StatefulWidget {
  const calculator({ Key? key }) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var result='';



  Widget btnn(var value){
    return ElevatedButton(onPressed: (){
      setState(() {
        result = result + value;
      });
    },child: Text(value,style: TextStyle(fontSize: 25),), style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(35),
      shape: CircleBorder() ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
          SizedBox(height:20),
          Text(result,textDirection: TextDirection.ltr,style: TextStyle(fontSize:50),),

          SizedBox(height:20),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            ElevatedButton(onPressed: (){
              setState(() {
                result = '';
              });
            }, style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),shape: CircleBorder()), child: Text('AC',style: TextStyle(fontSize: 25),)),
            btnn('%'),
            btnn('/'),

          ],),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            btnn('7'),
            btnn('8'),
            btnn('9'),
            btnn('*'),

          ],),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            btnn('4'),
            btnn('5'),
            btnn('6'),
            btnn('-'),

          ],),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            btnn('1'),
            btnn('2'),
            btnn('3'),
            btnn('+'),

          ],),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            btnn('0'),
            btnn('.'),
            ElevatedButton(onPressed: (){
              Parser p = Parser();
                Expression exp = p.parse(result);
                ContextModel cm = ContextModel();
                double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
                result = eval.toString();

              });
            }, child: Text('=',style: TextStyle(fontSize:25),),style: ElevatedButton.styleFrom(padding: EdgeInsets.all(35),shape: CircleBorder()) ),

          ],),
          SizedBox(height:20),

        ],
      ),
      
    );
  }
}

