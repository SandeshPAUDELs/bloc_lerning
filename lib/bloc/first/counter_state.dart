import 'package:equatable/equatable.dart';
class CounterState extends Equatable{
  final int counter;
  const CounterState({ // creating constructor
    this.counter = 0
  });
  CounterState copyWith({int ? counter}){
    return CounterState(
      counter: counter ?? this.counter   // if value is null then returns this.counter value
    );

  }
  @override
  List <Object> get props => [counter]; 
}