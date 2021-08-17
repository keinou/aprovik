import 'package:aprovik/config.page.dart';
import 'package:aprovik/liberacao.model.dart';
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
        titulo: "Pedido 1",
        descricao: "Pedido 1, Cliente H, Alinhamento com X",
        solicitante: "Rafael Karczevski",
        status: 1,
        data: "10/08/2021",
        hora: "15:21"));
    liberacoes.add(Liberac(
        titulo: "Pedido 45",
        descricao: "Pedido 45, conforme proposta UYYY",
        solicitante: "XH da Y",
        status: 1,
        data: "11/08/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Contrato 4877",
        descricao: "Contrato 4877 fornecedor JU",
        solicitante: "Rafael Karczevski",
        status: 2,
        data: "27/03/2021",
        hora: "16:47"));
    liberacoes.add(Liberac(
        titulo: "Contrato 4754",
        descricao: "Contrato 4754, contrato e proposta alinhados xxxx",
        solicitante: "Pedinte",
        status: 2,
        data: "29/03/2021",
        hora: "18:10"));
    liberacoes.add(Liberac(
        titulo: "Proposta 5",
        descricao: "Proposta 5, bloqueio por valor",
        solicitante: "Pedinte",
        status: 3,
        data: "29/03/2021",
        hora: "18:10"));
    liberacoes.add(Liberac(
        titulo: "Proposta 8",
        descricao: "Proposta 8, bloqueio por serasa",
        solicitante: "Pedinte",
        status: 3,
        data: "29/03/2021",
        hora: "18:10"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        ClipPath(
          clipper: WaveClipperHome(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFF247BA0),
            ),
          ),
        ),
        Column(
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConfigPage(),
                          ));
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
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 15, 15),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    new Text(
                                                      item.titulo,
                                                      style: TextStyle(
                                                          fontSize: 20),
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
      ],
    )));
  }
}

class WaveClipperHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.7);

    var firstStartPoint = Offset(size.width * 0.26, size.height * 0.52);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.56);
    path.quadraticBezierTo(firstStartPoint.dx, firstStartPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    firstStartPoint = Offset(size.width * 0.67, size.height * 0.28);
    firstEndPoint = Offset(size.width * 0.71, size.height * 0.32);
    path.quadraticBezierTo(firstStartPoint.dx, firstStartPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
