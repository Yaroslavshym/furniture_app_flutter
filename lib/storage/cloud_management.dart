import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:furniture_app_flutter/classes/Furniture.dart';

Future<String> getImageURl(Furniture product) async {
  final app = Firebase.app('storage');
  final storageRef =
      FirebaseStorage.instanceFor(app: app).ref().child(product.imageName);
  return await storageRef.getDownloadURL();
}

Future<int> getDatabaseLength() async {
  final ref = FirebaseDatabase.instanceFor(app: Firebase.app('database')).ref();
  return ref.once().then((value) {
    return value.snapshot.children.length;
  });
}

// Usage
// data.forEach((element) {
//   int b;
//   var a = element.child('price').value;
Future<List<Furniture>> getData() async {
  List<Furniture> objectList = [];
  final ref = FirebaseDatabase.instanceFor(app: Firebase.app('database')).ref();
  return ref.once().then((value) {
    Iterable<DataSnapshot> data = value.snapshot.children;
    for (DataSnapshot itemMap in data) {
      Object? price = itemMap.child('price').value;
      Object? title = itemMap.child('title').value;
      Object? imageName = itemMap.child('image_name').value;
      Object? description = itemMap.child('description').value;
      Object? newPrice = itemMap.child('new_price').value;
      Object? rating = itemMap.child('rating').value;

      if (price is num &&
          title is String &&
          imageName is String &&
          description is String) {
        objectList.add(Furniture(
          price: price,
          title: title,
          description: description,
          imageName: imageName,
          rating: rating is num ? rating : 0,
          newPrice: newPrice is num ? newPrice : null,
        ));
      }
    }
    return objectList;
  });
}
