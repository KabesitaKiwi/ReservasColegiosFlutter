import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Reservas Actividades Colegios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void coloreslimites(){
    if (_counter<10){
      _incrementCounter();

    }else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Aviso'),
          content: Text('NO PULSE MAS EL BOTON, NO SE VA A SUMAR MAS'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ),
      );
    }
  }
  void coloreslimitesRestar(){
    if (_counter>-10){
      restar();

    }else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Aviso'),
          content: Text('NO PULSE MAS EL BOTON, NO SE VA A RESTAR MAS'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ),
      );
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }
void restar(){

    setState(() {
      _counter --;
    });
}
void restablecer(){
    setState(() {
      _counter = 0;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text('INICIAR SESION',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'monocraft',
                ),
              ),
            ),
            const SizedBox(
              height: 75,
              width: 250,
              child: TextField(
                obscureText: true,
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
            const SizedBox(
              width: 250,
                child: TextField(
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
              onPressed: () {},
              child: const Text('Entrar'),
              ),
          ],
        ),
      )
    );
  }
}
