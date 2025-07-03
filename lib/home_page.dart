import 'package:belajar_stream/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterCubit cubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cubit Apps')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: cubit.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    'loading..',
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  cubit.kurangdata();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  cubit.tambahdata();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
