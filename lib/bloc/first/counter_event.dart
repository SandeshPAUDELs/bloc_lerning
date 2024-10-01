import 'package:equatable/equatable.dart';
abstract class CounterEvent extends Equatable {
  const CounterEvent(); // this counter acts a a base class and helps to implement features for base classes 
  @override
  List<Object> get props => [];

}
class IncrementCounter extends CounterEvent{} // counter event ko sub class implement gareko
