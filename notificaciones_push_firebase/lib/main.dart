import 'package:flutter/material.dart';
import 'package:notificaciones_push_firebase/pantallas/pantalla_mensajes.dart';
import 'package:notificaciones_push_firebase/pantallas/pantalla_principal.dart';
import 'package:notificaciones_push_firebase/services/notificaciones.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicioNotificacionPush.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ServicioNotificacionPush.messageStream.listen((message) {
      print(message);
      //Navigator.pushNamed(context, 'pantallaMensaje');
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
      navigatorKey.currentState?.pushNamed('pantallaMensaje');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: 'pantallaPrincipal',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'pantallaPrincipal': (_) => PantallaPrincipal(),
        'pantallaMensaje': (_) => PantallaMensaje()
      },
    );
  }
}
