import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _info = "Pode Entrar";

  void _contaPessoa(int delta) {

    setState(() {
      _pessoa += delta;

      if (_pessoa <0){
        _info = "Mundo invertido ?!";
      }else if(_pessoa <=10){
        _info = "Pode entrar !";
      }else{
        _info= "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bar.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoa $_pessoa", style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue)),
                    onPressed: () {
                      _contaPessoa(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue)),
                    onPressed: () {
                      _contaPessoa(-1);
                    },
                  ),
                )
              ],
            ),
            Text(_info,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
