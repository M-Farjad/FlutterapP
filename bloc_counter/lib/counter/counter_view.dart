import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/counter/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            onPressed: context.read<CounterCubit>().increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            onPressed: context.read<CounterCubit>().decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$state',
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
