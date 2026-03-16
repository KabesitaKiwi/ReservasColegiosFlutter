import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
  }
class _LoginScreenState extends State<LoginScreen> {
  // --- Paso 1: Creamos los controladores ---
  // Son como "espías" que leerán lo que el usuario escriba
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  // --- Paso 2: Limpieza de memoria ---
  // Esto es obligatorio cuando usamos controladores para evitar fugas de memoria
  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: const Text('Mi App de Reservas'),
        ),
        body: Padding(padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 75,
                child: Text('INICIAR SESION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'monocraft', // ¡Qué buen detalle la fuente!
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                width: 250,
                child: TextField(
                  controller: _userController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                      labelStyle: const TextStyle(
                        fontFamily: 'monocraft',
                        fontSize: 18,
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(
                      fontFamily: 'monocraft',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print('Usuario Ingresado: ${_userController.text}');
                  print('Contraseña Ingresada: ${_passwordController.text}');

                  String usuario = _userController.text;
                  String contrasenia = _passwordController.text;

                  if (usuario.isNotEmpty && contrasenia.isNotEmpty){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Porfi, ingresa el usuario y contraseña'),
                      backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        )
    );
  }
}