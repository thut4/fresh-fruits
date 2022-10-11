import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controllers/auth_controller.dart';

FirebaseAuth auth = FirebaseAuth.instance;

final Future<FirebaseApp> firebaseIntialization = Firebase.initializeApp();
AuthController authController = AuthController.instance;
GoogleSignIn googleSign = GoogleSignIn();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
