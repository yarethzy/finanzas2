import 'package:finanzas2/page/registrar.dart';
import 'package:flutter/material.dart';
import 'home.dart'; // Importa la pantalla de inicio

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Simulación de datos de usuario registrado
  final Map<String, String> registeredUsers = {
    'usuario1@example.com': 'contrasena123',
    'usuario2@example.com': 'password456',
    'yarethzybeltran80@gmail.com': 'yarethzy1821',
    // Agrega más usuarios según sea necesario
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INICIAR '),
        automaticallyImplyLeading: false, // Quitar la flecha de retroceso
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 122, 200, 245),
              Color.fromARGB(223, 133, 164, 211),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono de alcancía de cerdito
              Container(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Icon(
                  Icons.account_balance,
                  size: 48.0,
                  color: Colors.white,
                ),
              ),
              // Campo de correo electrónico
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 16),
              // Campo de contraseña
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _login(context);
                },
                child: Text('Ingresar'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navegar a la pantalla de registro si el usuario aún no está registrado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text('¿No tienes una cuenta? Regístrate aquí'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Verifica las credenciales con la simulación de datos de usuario registrado
    if (registeredUsers.containsKey(email) &&
        registeredUsers[email] == password) {
      print('Inicio de sesión exitoso para el correo: $email');

      // Ir a la pantalla de inicio
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Muestra un SnackBar indicando que las credenciales son incorrectas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales incorrectas. Verifica tus datos.'),
          duration: Duration(seconds: 2), // Duración del SnackBar
        ),
      );
    }
  }
}
