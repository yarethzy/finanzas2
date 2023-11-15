import 'package:flutter/material.dart';

class GastosForm extends StatefulWidget {
  @override
  _GastosFormState createState() => _GastosFormState();
}

class _GastosFormState extends State<GastosForm> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Gasto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Caja de texto redonda con icono para la descripción
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Borde redondeado
                color:
                    Theme.of(context).colorScheme.background, // Color de fondo
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.description, color: Colors.black),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _descripcionController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción del gasto',
                          border: InputBorder.none, // Sin borde
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Caja de texto redonda con icono para el monto
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Borde redondeado
                color:
                    Theme.of(context).colorScheme.background, // Color de fondo
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.black),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _montoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Monto',
                          border: InputBorder.none, // Sin borde
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                  'Gasto: $descripcion - \$${monto.toStringAsFixed(2)}',
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
