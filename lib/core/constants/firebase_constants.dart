import 'package:cloud_firestore/cloud_firestore.dart';

final class FireStoreConstants{

  // collections names
  static const favorites = "favorites";

  static const basket = 'basket';

  static FirebaseFirestore db = FirebaseFirestore.instance;
}