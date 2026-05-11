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
      "id": 1,
      "pertanyaan": "2 + 2 = ?",
      "pilihan": ["1", "2", "3", "4"]
    }
  ];

  Map<int, String> jawabanUser = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CBT Online"),
      ),

      body: ListView.builder(
        itemCount: soal.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    soal[index]["pertanyaan"],
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  ...soal[index]["pilihan"].map<Widget>((pil) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            jawabanUser[soal[index]["id"]] = pil;
                          });
                        },
                        child: Text(pil),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 10),

                  Text(
                    "Jawaban kamu: ${jawabanUser[soal[index]["id"]] ?? "-"}",
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(jawabanUser);
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
