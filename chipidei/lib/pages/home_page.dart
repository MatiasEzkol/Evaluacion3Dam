import 'package:chipidei/forms/educadora_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleboton = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(65.0),
    )));

    final ButtonStyle stylebotonlar = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(70.0),
    )));

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos al Jardin CHIPIDEI'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 170, bottom: 40, right: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            image: DecorationImage(
                image: NetworkImage(
                    "https://lirp.cdn-website.com/de418cbe/dms3rep/multi/opt/31412-jardin-infantil-sala-cuna-principito-tren-flat-802w.png"),
                alignment: Alignment.topCenter)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: styleboton,
                        //color: Colors.white,
                        //shape: new RoundedRectangleBorder(
                        //  borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/inicio");
                        },
                        child: SizedBox(
                          width: 125,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Educadora",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: styleboton,
                        // color: Colors.white,
                        // shape: new RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/empresa");
                        },
                        child: SizedBox(
                          width: 125,
                          height: 100,
                          child: Center(
                            child: Text(
                              "Niño",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: styleboton,
                        // color: Colors.white,
                        // shape: new RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/productos");
                        },
                        child: SizedBox(
                          width: 125,
                          height: 100,
                          child: Center(
                            child: Text("Eventos", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: styleboton,
                        onPressed: () {
                          // Navigator.pushNamed(context, "/contacto");
                        },
                        child: SizedBox(
                          width: 125,
                          height: 100,
                          child: Center(
                            child: Text("Nivel", textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: stylebotonlar,
                    // color: Colors.white,
                    // shape: new RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => EducadoraAgregarPage(),
                      );
                      Navigator.push(context, route).then((value) {
                        setState(() {});
                      });
                      // Navigator.pushNamed(context, "/productos");
                    },
                    child: SizedBox(
                      width: 400,
                      height: 25,
                      child: Center(
                        child: Text("Crear  Perfil Educadora",
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: stylebotonlar,
                    // color: Colors.white,
                    // shape: new RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      // MaterialPageRoute route = MaterialPageRoute(
                      //   builder: (context) => EducadoraAgregarPage(),
                      // );
                      // Navigator.push(context, route).then((value) {
                      //   setState(() {});
                      // });

                      //Navigator.pushNamed(context, "/educadora");
                    },
                    child: SizedBox(
                      width: 400,
                      height: 25,
                      child: Center(
                        child: Text("Crear Perfil de Niños",
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: stylebotonlar,
                    // color: Colors.white,
                    // shape: new RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      // Navigator.pushNamed(context, "/productos");
                    },
                    child: SizedBox(
                      width: 400,
                      height: 25,
                      child: Center(
                        child: Text("Crear Historial de Eventos",
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: stylebotonlar,
                    // color: Colors.white,
                    // shape: new RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      // Navigator.pushNamed(context, "/productos");
                    },
                    child: SizedBox(
                      width: 400,
                      height: 25,
                      child: Center(
                        child: Text("Crear Nivel", textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
