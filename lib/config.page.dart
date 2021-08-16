import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String authMeth;
  @override
  void initState() {
    super.initState();
  }

  /*
  IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                color: Color(0xFF247BA0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                margin: EdgeInsets.only(bottom: 50),
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.75,
                  //height: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/profile.png",
                          width: 70,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rafael Karczevski",
                              style: TextStyle(fontSize: 21),
                            ),
                            Text(
                              "rkarczevski@gmail.com",
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 50),
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.75,
                  //height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Nome da Empresa'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'URL para requisições'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButton<String>(
                        focusColor: Colors.white,
                        isExpanded: true,
                        value: authMeth,
                        //elevation: 5,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Sem Autenticação',
                          'Basic Auth',
                          'Bearer Auth',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Autenticação",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            authMeth = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.save),
                      Text("Salvar"),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                elevation: 15,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.exit_to_app),
                      Text("Sair da Conta"),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
