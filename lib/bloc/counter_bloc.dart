import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_state.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState())  // creating constructor
  // super ma counter state kina pass gareko bhanda 
  // by default hamro bloc ko state hunxa ne tyo state lai by default yo state ko counter block ma insitial state pass garnako lagi
  {
    on<IncrementCounter>(_increment);
  }
  void _increment(IncrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }
}