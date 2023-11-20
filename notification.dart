import 'package:flutter/material.dart';
import 'package:local_notifications/services/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Aquí inicializamos la instancia de notificaciones
  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const PaginaPrincipal(),
      ),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            // Aquí debemos mostrar la notificación
            showNotificacion();
          },
          child: const Text('Mostrar la notificación')),
    );
  }
}