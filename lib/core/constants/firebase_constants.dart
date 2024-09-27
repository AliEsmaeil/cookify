import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FireStoreConstants{

  // collections names
  static const favorites = "favorites";
  static const mealsInFavorites = 'mealsInFavorites';

  static const basket = 'basket';
  static const mealsInBasket = 'mealsInBasket';

  static final  db = FirebaseFirestore.instance;
  static final  auth = FirebaseAuth.instance;
}