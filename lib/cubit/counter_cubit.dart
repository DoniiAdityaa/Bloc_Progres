import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super((0));

  void tambahdata() {
    emit(state + 1);
  }

  void kurangdata() {
    emit(state - 1);
  }
}
