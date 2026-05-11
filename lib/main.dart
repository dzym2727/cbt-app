import 'package:flutter/material.dart';

void main() {
  runApp(const CBTApp());
}

class CBTApp extends StatelessWidget {
  const CBTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List soal = [
    {
      "pertanyaan": "2 + 2 = ?",
      "pilihan": ["1", "2", "3", "4"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CBT Online")),
      body: ListView.builder(
        itemCount: soal.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(soal[index]["pertanyaan"]),
            ),
          );
        },
      ),
    );
  }
}
