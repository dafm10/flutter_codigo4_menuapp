
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirestoreService{

  final String collection ;

  MyFirestoreService({
    required this.collection
});

  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);

  Future getProducts() async {
    QuerySnapshot _querySnapshot = await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      print(element.data());
    });
  }


}