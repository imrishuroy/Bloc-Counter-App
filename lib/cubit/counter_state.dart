part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncemented;

  CounterState({
    @required this.counterValue,
    this.wasIncemented,
  });

  @override
  List<Object> get props => [this.counterValue, this.wasIncemented];
}
