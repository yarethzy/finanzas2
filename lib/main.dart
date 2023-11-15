import 'package:flutter/material.dart';
import 'package:couchbase_lite/couchbase_lite.dart';

void main() async {
  // Asegúrate de que los widgets estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Couchbase Lite
  await CouchbaseLite.init();

  // Lanzar la aplicación
  runApp(MyApp());
}

class CouchbaseLite {
  static Future<void> init() async {
    // Agrega la lógica de inicialización si es necesario
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Couchbase Lite Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Couchbase Lite Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Aquí puedes poner el código del paso 3
            final Database database =
                await Database.initWithName('my_database');
            final MutableDocument document = MutableDocument();
            document.setString('name', 'John Doe');
            document.setInt('age', 30);
            await database.saveDocument(document);

            // Puedes agregar más operaciones aquí según tus necesidades
          },
          child: Text('Operaciones con Couchbase Lite'),
        ),
      ),
    );
  }
}
