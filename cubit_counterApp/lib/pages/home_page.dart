import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit =
      CounterCubit(); //CounterCubit sınıfından bir nesne oluşturdum

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          //bloc builder state değişimi dinleyerek ui günceller
          bloc: counterCubit, // Hangi Cubit'i dinliyor? --> counterCubit
          builder: (context, counter) {
            return Text(
              "$counter",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterCubit.increment,
            child: const Icon(Icons.add),
            tooltip: "Increment",
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterCubit.decrement,
            child: const Icon(Icons.remove),
            tooltip: "Decrement",
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterCubit.reset,
            child: const Icon(Icons.refresh),
            tooltip: "Reset",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //dispose ile --> Sayfa kapandığında CounterCubit nesnesini kapatır, böylece bellek sızıntısı (memory leak) oluşmaz.
    counterCubit.close();
    super.dispose();
  }
}
