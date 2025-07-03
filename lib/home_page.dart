import 'package:belajar_stream/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  // final Counter mycounter = Counter(init: 0);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Counter bloccounter = Counter(init: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLOC BUILDER')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            // buildWhen: (previous, current) {
            //   if (current % 2 == 1) {
            //     return true;
            //   } else {
            //     return false;
            //   }
            // },
            bloc: bloccounter,
            builder: (context, state) {
              return Center(
                child: Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  bloccounter.kurangdata();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  bloccounter.tambahdata();
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
