import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
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
          Center(
            child: Card(
              margin: EdgeInsets.only(bottom: 50),
              elevation: 15,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
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
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome da Empresa'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'URL para requisições'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
