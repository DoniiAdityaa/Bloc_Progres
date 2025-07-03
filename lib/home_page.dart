import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  Stream<int> counterStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      appBar: AppBar(title: Text('Stream Example')),
      body: StreamBuilder(
        stream: widget.counterStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Loadig...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            );
          } else {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
