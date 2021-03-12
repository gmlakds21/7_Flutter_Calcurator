import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {

  static const title = "CalculatorApp"; // 상수 선언

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Calculator()
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  CalculatorMain createState() => CalculatorMain();
}

class CalculatorMain extends State<Calculator> {

  // 관련 변수 선언
  List btnList = ["더하기", "빼기", "곱하기", "나누기"];
  List<DropdownMenuItem<String>> dropmenu = new List();
  String btnText;
  String total = "";
  TextEditingController val1 = TextEditingController();
  TextEditingController val2 = TextEditingController();

  @override
  void initState() {  // 앱 실행시 수행해야할 초기화 작업 정의
    for (var item in btnList) {
      dropmenu.add(DropdownMenuItem(value:item, child:Text(item),));
    }
    btnText = dropmenu[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("플리터 계산기 앱")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15),
                child: Text('계산결과 : $total', style:TextStyle(fontSize: 20),),),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: val1,)),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: val2,)),
              Padding(padding: EdgeInsets.all(15),
                child: RaisedButton(child: Row(children: <Widget>[Icon(Icons.add), Text(btnText)],),
                  color: Colors.amber,
                  onPressed: () { // 클릭시 입력값을 계산함
                    setState(() {
                      var v1 = double.parse(val1.value.text);
                      var v2 = double.parse(val2.value.text);
                      var result;
                      if (btnText == '더하기') {result = v1 + v2;}
                      else if (btnText == '빼기' ) {result = v1 - v2;}
                      else if (btnText == '곱하기' ) {result = v1 * v2;}
                      else if (btnText == '나누기' ) {result = v1 / v2;}
                      total = result.toString();
                    });
                  },),),
              Padding(padding: EdgeInsets.all(15),
                child: DropdownButton(
                  items: dropmenu,
                  onChanged: (value) {
                    setState(() {
                      btnText = value;
                    });
                  },
                  value: btnText,
                ),)
            ],
          )
        )
      )
    );
  }


}