import 'package:chipidei/forms/educadora_form.dart';
import 'package:chipidei/pages/educadora/lista_edu_page.dart';
import 'package:chipidei/pages/educadora/perfil_edu_page.dart';
import 'package:chipidei/pages/evento/lista_eventos_page.dart';
import 'package:chipidei/pages/nino/lista_ninos_page.dart';
import 'package:chipidei/pages/nino/perfil_nino_page.dart';
import 'package:chipidei/pages/nivel/lista_niveles_page.dart';
import 'package:chipidei/forms/eventos_form.dart';
import 'package:chipidei/forms/nino_form.dart';
import 'package:chipidei/forms/nivel_form.dart';
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
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 199, 252, 255)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(65.0),
        )));

    final ButtonStyle stylebotonlar = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 199, 252, 255)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0),
        )));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 231, 98, 231),
            title: Text(
              'Bienvenidos al Jardin CHIPIDEI',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 170, bottom: 40, right: 10, left: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 191, 235),
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
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => ListaEduPage(),
                              );
                              Navigator.push(context, route).then((value) {
                                setState(() {});
                              });
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
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => ListaNinosPage(),
                              );
                              Navigator.push(context, route).then((value) {
                                setState(() {});
                              });
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
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => ListaEventosPage(),
                              );
                              Navigator.push(context, route).then((value) {
                                setState(() {});
                              });
                            },
                            child: SizedBox(
                              width: 125,
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Eventos",
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
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => ListaNivelesPage(),
                              );
                              Navigator.push(context, route).then((value) {
                                setState(() {});
                              });
                            },
                            child: SizedBox(
                              width: 125,
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Nivel",
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
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: stylebotonlar,
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => EducadoraAgregarPage(),
                          );
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: SizedBox(
                          width: 400,
                          height: 25,
                          child: Center(
                            child: Text(
                              "Crear  Perfil Educadora",
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
                        style: stylebotonlar,
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => NinoAgregarPage(),
                          );
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: SizedBox(
                          width: 400,
                          height: 25,
                          child: Center(
                            child: Text(
                              "Crear Perfil de Niños",
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
                        style: stylebotonlar,
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => EventoAgregarPage(),
                          );
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: SizedBox(
                          width: 400,
                          height: 25,
                          child: Center(
                            child: Text(
                              "Crear Historial de Eventos",
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
                        style: stylebotonlar,
                        onPressed: () {
                          MaterialPageRoute route = MaterialPageRoute(
                            builder: (context) => NivelAgregarPage(),
                          );
                          Navigator.push(context, route).then((value) {
                            setState(() {});
                          });
                        },
                        child: SizedBox(
                          width: 400,
                          height: 25,
                          child: Center(
                            child: Text(
                              "Crear Nivel",
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
          ),
        ));
  }
}
