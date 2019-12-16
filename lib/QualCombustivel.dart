import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QualCombustivel extends StatefulWidget {
  @override
  _QualCombustivelState createState() => _QualCombustivelState();
}

class _QualCombustivelState extends State<QualCombustivel> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = '';

  void _calcular() {
    String precoAlcoolStr = _controllerAlcool.text;
    String tmpAlcool = precoAlcoolStr.replaceAll(',', '.');

    String precoGasolinaStr = _controllerGasolina.text;
    String tmpGasolina = precoGasolinaStr.replaceAll(',', '.');

    double precoAlcool = double.tryParse(tmpAlcool);
    double precoGasolina = double.tryParse(tmpGasolina);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = '';
      });
    } else {
      setState(() {
        _resultado = '';
      });
    }

    if ((precoAlcool / precoGasolina) >= 0.7) {
      _resultado = 'Melhor abastecer com gasolina';
    } else {
      _resultado = 'Melhor abastecer com álcool';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
        'Álcool ou Gasolina?'
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlueAccent
          )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/topimg.png'),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço Álcool. Ex.: 3,27'
                ),
                style: TextStyle(
                    fontSize: 25
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço Gasolina. Ex.: 4,59'
                ),
                style: TextStyle(
                    fontSize: 25
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(9),
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                    _resultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
