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
      home: const MyHomePage(title: 'Mi hola mundo de futter'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('has pulsado este boton estas veces: '),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _counter == 0
                  ?Colors.black
                    : _counter > 0
                      ?Colors.green
                      :Colors.red,
              )
            ),
            ElevatedButton(onPressed: coloreslimitesRestar, child: Text('restar contador')),
            ElevatedButton(onPressed: restablecer, child: Text('restablecer contador'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: coloreslimites,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
