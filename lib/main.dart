import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/screens/home_page.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counterBloc = CounterCubit();

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterState1 = CounterState(counterValue: 0);
    final counterState2 = CounterState(counterValue: 0);
    print(counterState1 == counterState2);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: HomePage(),
      // ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterBloc,
              child: HomePage(),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterBloc,
              child: SecondScreen(),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterBloc,
              child: ThirdScreen(),
            ),
      },
    );
  }
}
