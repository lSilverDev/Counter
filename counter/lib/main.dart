import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const counter());
}

class counter extends StatelessWidget {
  const counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement(){
    setState(() {
      count--;
    });
  }
  
  void increment(){
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/darkness.jpg'),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Loaded' : 'You can Enter!',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Exited', 
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Came in', 
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}