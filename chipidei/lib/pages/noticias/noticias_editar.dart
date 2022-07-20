import 'package:chipidei/services/firestore_service.dart';
import 'package:flutter/material.dart';

class NoticiasEditar extends StatefulWidget {
  String noticiaId;
  NoticiasEditar(this.noticiaId, {Key? key}) : super(key: key);

  @override
  State<NoticiasEditar> createState() => _NoticiasEditarState();
}

class _NoticiasEditarState extends State<NoticiasEditar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloCtrl = TextEditingController();
    TextEditingController descripcionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Noticia'),
        backgroundColor: Color(0xFF363942),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FutureBuilder(
              future: FirestoreService().getNoticia(widget.noticiaId),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var noticia = snapshot.data;
                tituloCtrl.text = noticia['titulo'];
                descripcionCtrl.text = noticia['descripcion'];

                return ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            'Codigo noticia:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.noticiaId),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: tituloCtrl,
                      decoration: InputDecoration(
                        labelText: 'Titulo noticia',
                      ),
                    ),
                    TextFormField(
                      controller: descripcionCtrl,
                      decoration: InputDecoration(
                        labelText: 'Descripcion',
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: Text('Editar noticia'),
                        onPressed: () async {
                          String titulo = tituloCtrl.text.trim();
                          String descripcion = descripcionCtrl.text.trim();

                          FirestoreService().noticiasEditar(
                              widget.noticiaId, titulo, descripcion);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
