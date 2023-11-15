import 'package:flutter/material.dart';

class IngresosForm extends StatefulWidget {
  @override
  _IngresosFormState createState() => _IngresosFormState();
}

class _IngresosFormState extends State<IngresosForm> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Ingreso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Caja de texto redonda con icono para la descripción
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor, // Color de fondo
              ),
              child: Row(
                children: [
                  Icon(Icons.description, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _descripcionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Descripción del ingreso',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Caja de texto redonda con icono para el monto
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor, // Color de fondo
              ),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _montoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Monto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes procesar los datos ingresados
                String descripcion = _descripcionController.text;
                double monto = double.tryParse(_montoController.text) ?? 0.0;

                // Puedes imprimir los datos o realizar otras acciones
                print('Descripción: $descripcion');
                print('Monto: $monto');

                // Puedes cerrar el formulario después de procesar los datos
                Navigator.pop(
                  context,
                  'Ingreso: $descripcion - \$${monto.toStringAsFixed(2)}',
                );
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
