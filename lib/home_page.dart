import 'package:belajar_stream/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Counter blockuu = Counter();
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: Text("bloc PROVIDER")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    counterBloc.kurangdata();
                  },
                  borderRadius: BorderRadius.circular(15),

                  child: SizedBox(
                    height: 100,
                    width: 70,
                    child: const Center(
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
                child: Center(
                  child: BlocBuilder<Counter, int>(
                    bloc: BlocProvider.of<Counter>(context),
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    counterBloc.tambahdata();
                  },
                  borderRadius: BorderRadius.circular(15),

                  child: SizedBox(
                    height: 100,
                    width: 70,
                    child: const Center(
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
