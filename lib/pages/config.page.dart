import 'package:appwrite/appwrite.dart';
import 'package:aprovik/constants.dart';
import 'package:aprovik/controller/user.controller.dart';
import 'package:aprovik/pages/login.page.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String authMeth;
  double height = 218;

  TextEditingController eCnome =
      TextEditingController(text: Constants.usr.name);
  TextEditingController eCempresa =
      TextEditingController(text: Constants.usr.prefs.empresa);
  TextEditingController eCendPoint =
      TextEditingController(text: Constants.usr.prefs.endPoint);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
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
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.75) -
                                        70 -
                                        45,
                                child: TextFormField(
                                  controller: eCnome,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Nome'),
                                ),
                              ),
                              /*Text(
                                "Rafael Karczevski",
                                style: TextStyle(fontSize: 21),
                              ),*/
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
                          controller: eCempresa,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nome da Empresa'),
                        ),
                        TextFormField(
                          controller: eCendPoint,
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
                GestureDetector(
                  onTap: () async {
                    Account ac = Account(Constants.cl);
                    Map<dynamic, dynamic> prefs = {
                      "empresa": eCempresa.text,
                      "endPoint": eCendPoint.text,
                      "auth": "none",
                      "bearer": "token",
                      "basicUser": "user",
                      "basicPass": "Pass"
                    };
                    await ac.updatePrefs(prefs: prefs);
                    await ac.updateName(name: eCnome.text);
                    await UserController.getUser();
                  },
                  child: Card(
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
                ),
                GestureDetector(
                  onTap: () async {
                    Account ac = Account(Constants.cl);
                    await ac.deleteSessions();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  child: Card(
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
                )
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
