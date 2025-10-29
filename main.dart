import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

 var you_rock;
var you_paper;
var you_scissors;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Rock-paper-Scissors'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum Scelta{carta, sasso, forbici}


class _MyHomePageState extends State<MyHomePage> {
  Scelta? sceltaUtente;
  Scelta? sceltaPC;
  String ris = '';

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
           decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("background.jpg"),
              fit: BoxFit.cover
              )
           ),
        //Accetta solo un child, quindi usiamo prima Row
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
            
                Text( 
                  'Computer ha scelto: ${sceltaPC?.name ?? '-'}',
                  style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 100),

                  Text(
                    'Risultato: ${ris}',
                    style: TextStyle(fontSize: 25)
                  ),
              

          
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
               FloatingActionButton(
                  onPressed: ()=> _game(Scelta.sasso), 
                   child: Icon(
                    Icons.cloud,
                    color: Colors.black
                    ),
                    backgroundColor : Color.fromARGB(255, 180, 176, 176)
                ),
                SizedBox(
                  width: 10
                ),
                FloatingActionButton(
                  onPressed: ()=> _game(Scelta.carta), 
                   child: Icon(
                    Icons.article,
                    color: Colors.black
                    ),
                    backgroundColor : Color.fromARGB(255, 180, 176, 176)
                ),
                SizedBox(
                  width: 10
                ),
                FloatingActionButton(
                  onPressed: ()=> _game(Scelta.forbici), 
                   child: Icon(
                    Icons.content_cut,
                    color: Colors.black
                    ),
                    backgroundColor : Color.fromARGB(255, 180, 176, 176)
                ),
                SizedBox(
                  width: 10
                )

               ]

              ), //Row for User Choice
                
            ]
      ),
     
     
      
    
    ),
    
    
    
    );
  }

    void _game(Scelta scelta){
      setState(() {
              sceltaUtente = scelta;
              sceltaPC = Scelta.values[Random().nextInt(Scelta.values.length)];
              ris = _calcolaRisultato(sceltaUtente!, sceltaPC!);
            });
    }

    String _calcolaRisultato(Scelta utente, Scelta computer) {
  if (utente == computer) return 'Pareggio!';
  if ((utente == Scelta.carta && computer == Scelta.sasso) ||
      (utente == Scelta.sasso && computer == Scelta.forbici) ||
      (utente == Scelta.forbici && computer == Scelta.carta)) {
    return 'Hai vinto!';
  } else {
    return 'Hai perso!';
  }
}
}
