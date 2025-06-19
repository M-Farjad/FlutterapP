import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class Increment extends CounterEvent {}

// Bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
  }
}
