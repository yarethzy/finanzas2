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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Caja de texto redonda con icono para la descripción
            TextFormField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción del ingreso',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Caja de texto redonda con icono para el monto
            TextFormField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto',
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
