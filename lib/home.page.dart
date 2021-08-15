import 'package:aprovik/liberacao.mode.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Liberac> liberacoes = [];
  @override
  void initState() {
    liberacoes.add(Liberac(
        titulo: "Solicitação 001",
        descricao:
            "Solicito a Solicitação Solicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a SolicitaçãoSolicito a Solicitação",
        solicitante: "Rafael Karczevski",
        status: 1,
        data: "15/02/2021",
        hora: "15:21"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Solicitação H34",
        descricao: "Teste H34",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
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
                    ),
                    Text("Nome da Empresa")
                  ],
                ),
                Expanded(
                  child: IconButton(
                      alignment: Alignment.centerRight,
                      iconSize: 40,
                      color: Colors.grey,
                      onPressed: () {
                        print("foi pra config");
                      },
                      icon: Icon(Icons.settings)),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: liberacoes.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    Liberac item = liberacoes[index];
                    return GestureDetector(
                      onTap: () {
                        print('testing');
                      },
                      child: Container(
                          margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 25.0,
                          height: 110.0,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  color: item.getColorStatus(),
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                    child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 15, 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  new Text(
                                                    item.titulo,
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  new Text(
                                                    item.solicitante,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              new Text(
                                                  item.data +
                                                      " " +
                                                      item.hora +
                                                      "\n\n",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey))
                                            ],
                                          )),
                                      new Text(
                                        item.descricao,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          )),
                    );
                  }))
        ],
      ),
    ));
  }
}
