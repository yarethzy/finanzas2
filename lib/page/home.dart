import 'package:finanzas2/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ingreso.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
      primaryColor: Colors.greenAccent,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: Colors.yellow,
            background: Colors.lightBlue,
          )
          .copyWith(
            background: Colors.greenAccent,
          ),
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> transactions = [];
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Text(
                '\$',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
              ),
              child: Center(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Aquí deberías agregar la lógica para cerrar sesión
                // Por ejemplo, podrías navegar a la pantalla de inicio de sesión (MyApp).
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyApp()), // Reemplaza con tu pantalla de inicio de sesión
                );
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: transactions.isEmpty
                    ? Text('No hay transacciones')
                    : DataTable(
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(
                            label: const Text('Fecha'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                transactions.sort((a, b) => ascending
                                    ? a.date.compareTo(b.date)
                                    : b.date.compareTo(a.date));
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Descripción'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                transactions.sort((a, b) => ascending
                                    ? a.description.compareTo(b.description)
                                    : b.description.compareTo(a.description));
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Monto'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                transactions.sort((a, b) => ascending
                                    ? a.amount.compareTo(b.amount)
                                    : b.amount.compareTo(a.amount));
                              });
                            },
                          ),
                        ],
                        rows: transactions
                            .map(
                              (transaction) => DataRow(
                                cells: [
                                  DataCell(Text(DateFormat('yyyy-MM-dd')
                                      .format(transaction.date))),
                                  DataCell(Text(transaction.description)),
                                  DataCell(Text(
                                      '\$${transaction.amount.toStringAsFixed(2)}')),
                                ],
                              ),
                            )
                            .toList(),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GastosForm()),
                );

                if (result != null) {
                  setState(() {
                    transactions.add(Transaction(result));
                    updateAmount(Transaction(result), isExpense: true);
                  });
                }
              },
              child: const Text('Agregar Gastos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IngresosForm()),
                );

                if (result != null) {
                  setState(() {
                    transactions.add(Transaction(result));
                    updateAmount(Transaction(result), isExpense: false);
                  });
                }
              },
              child: const Text('Agregar Ingresos'),
            ),
          ],
        ),
      ),
    );
  }

  void updateAmount(Transaction transaction, {required bool isExpense}) {
    double transactionAmount =
        isExpense ? -transaction.amount : transaction.amount;
    double currentAmount = double.tryParse(_amountController.text) ?? 0;

    double newAmount = currentAmount + transactionAmount;

    _amountController.text = newAmount.toString();
  }
}

class Transaction {
  final String description;
  final double amount;
  final DateTime date;

  Transaction(String transaction)
      : description = transaction.split(':').first.trim(),
        amount = double.tryParse(transaction.split('\$').last) ?? 0.0,
        date = DateTime.now();
}

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
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).colorScheme.background,
              ),
              child: const Icon(Icons.description, color: Colors.black),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción del gasto',
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).colorScheme.background,
              ),
              child: const Icon(Icons.monetization_on, color: Colors.black),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Monto',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String descripcion = _descripcionController.text;
                double monto = double.tryParse(_montoController.text) ?? 0.0;

                print('Descripción: $descripcion');
                print('Monto: $monto');

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
