import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ListTiles());
}

class ListTiles extends StatefulWidget {
  const ListTiles({super.key});

  @override
  State<ListTiles> createState() => _ListTilesState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _ListTilesState extends State<ListTiles> {
  @override
  void initState() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData.dark(),
      home: const WidgetTree(),
    );
  }
}
