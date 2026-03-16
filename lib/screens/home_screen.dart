import 'package:flutter/material.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Reservas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Aquí irá la lista de reservas',
          style: TextStyle(fontSize: 18),
        ),
      ),
      // Este botón flotante lo usaremos luego para el "Create" del CRUD
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Botón de añadir reserva presionado');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}