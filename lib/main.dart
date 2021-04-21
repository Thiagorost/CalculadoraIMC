import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "informe seu dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  void _resetFields(){
    weightController.text ="";
    heightController.text="";
    setState(() {
       _infoText = "Informe seus dados";
       _formKey = GlobalKey<FormState>();
      

    });
  
  }

  void _calculate(){
    setState(() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) /100;
    double imc = weight / (height*height);
    if (imc< 18.6){
      _infoText = "abaixo do peso (${imc.toStringAsPrecision(2)})";
    }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 40){
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Caculadora IMC",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0.0, 10.0, 0.0),
        child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person,
              size: 120,
              color: Colors.deepPurple[600],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              controller: weightController,
               validator:(value){
                 
                if (value.isEmpty){
                  return "Insira seu peso";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (CM)",
                labelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              controller: heightController,
              validator: (value){
                
                if(value.isEmpty){
                  return "Insira sua altura";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10.0),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calculate();
                    }
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.purple,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ],
        ),)
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Materia
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contador IMC",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.purple[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person,
            size: 120,
            color: Colors.green,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "peso (kg)",
                labelStyle: TextStyle(color: Colors.purple)),
         textAlign: TextAlign.center,
          style: TextStyle(color:Colors.purple, fontSize: 20.0),
          ),

          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.purple)),
         textAlign: TextAlign.center,
          style: TextStyle(color:Colors.purple, fontSize: 20.0),
          ),
        ],
      ),

drawer: Container(color: Colors.purple[100],
height: 500, width: 500,),

    );
  }
}
*/
