import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Altura para el AppBar
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Sin sombra
          title: Text(
            'REGISTRO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle.light, // Asegura que el texto sea blanco
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono en grande encima del campo de nombre
              Container(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Icon(
                  Icons.person,
                  size: 48.0, // Tamaño grande del icono
                  color: Colors.white, // Color del icono
                ),
              ),
              // Nombre
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person), // Icono para el nombre
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 16),
              // Correo Electrónico
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  prefixIcon:
                      Icon(Icons.email), // Icono para el correo electrónico
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 16),
              // Contraseña
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock), // Icono para la contraseña
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _register();
                },
                child: Text('Registrar'),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Navegar a la pantalla de inicio de sesión
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  '¿Ya tienes una cuenta? Ingresa',
                  style: TextStyle(
                    color:
                        Colors.white, // Puedes ajustar el color según tu diseño
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Simulación de guardar en la base de datos (puedes conectar con tu lógica real aquí)
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      print('Registro exitoso para el usuario: $name, correo: $email');

      // Después de registrar, ir a la pantalla de inicio de sesión
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      print('Error en el registro. Verifica tus datos.');
    }
  }
}
