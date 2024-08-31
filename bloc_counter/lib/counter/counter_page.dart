import 'package:bloc_counter/counter/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Counter state is $state'),
              duration: const Duration(milliseconds: 300),
            ),
          );
        },
        child: const CounterView(),
      ),
    );
  }
}
