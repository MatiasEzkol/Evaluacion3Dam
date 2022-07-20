import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
  }

//agregar noticias
  Future noticiasAgregar(String tituloId, String descripcion) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'titulo': tituloId,
      'descripcion': descripcion,
    });
  }

  //borrar noticias
  Future noticiasBorrar(String tituloId) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(tituloId)
        .delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getNoticia(
      String tituloId) async {
    return await FirebaseFirestore.instance
        .collection('noticias')
        .doc(tituloId)
        .get();
    // print(prod['nombre']);
  }

  //editar noticias
  Future noticiasEditar(String tituloId, String descripcion) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(tituloId)
        .update({'titulo': tituloId, 'descripcion': descripcion});
  }
}
