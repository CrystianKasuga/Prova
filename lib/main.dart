import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage(title: 'App Exame'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  String _mensagemExibida = '';
  void _mostrarTexto() {
    setState(() {
      _mensagemExibida = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(0, 0, 139, 1.0),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Seu nome'),
              accountEmail: Text('seuemail@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/bpk.png'),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(title: Text('Página 1')),
            ListTile(title: Text('Página 2')),
            ListTile(title: Text('Página 3')),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
          children: [
            Text(
              'Bem-vindo ao App Exame!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                print('Botão pressionado com sucesso!');
              },
              child: Text('Pressione-me'),
              style: ElevatedButton.styleFrom(),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Digite algo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _mostrarTexto();
              },
              child: const Text(
                'Mostrar Texto',
                style: TextStyle(color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            if (_mensagemExibida.isNotEmpty)
              Text(
                'Você digitou: $_mensagemExibida',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
