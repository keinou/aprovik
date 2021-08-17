import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String authMeth;
  double height = 218;
  @override
  void initState() {
    super.initState();
  }

  /*
  token : 265
  Sem Auth : 218
  Basic : 325

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
          /*Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                color: Color(0xFF247BA0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),*/
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 280,
              color: Color(0xFF247BA0),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          Center(
              child: SingleChildScrollView(
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
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: height,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nome da Empresa'),
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
                            if (value == 'Sem Autenticação') {
                              height = 210;
                            } else if (value == 'Basic Auth') {
                              height = 325;
                            } else if (value == 'Bearer Auth') {
                              height = 265;
                            }
                            setState(() {
                              authMeth = value;
                            });
                          },
                        ),
                        authMeth == 'Basic Auth'
                            ? TextFormField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Usuario'),
                              )
                            : Container(),
                        authMeth == 'Basic Auth'
                            ? TextFormField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Senha'),
                              )
                            : Container(),
                        authMeth == 'Bearer Auth'
                            ? TextFormField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Token'),
                              )
                            : Container()
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
            ),
          ))
        ],
      ),
    ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);

    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
