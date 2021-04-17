import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ///  final _counterBloc = CounterCubit();
  final AppRouter _router = AppRouter();

  // @override
  // void dispose() {
  //   _counterBloc.close();
  //   _router.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final counterState1 = CounterState(counterValue: 0);
    final counterState2 = CounterState(counterValue: 0);
    print(counterState1 == counterState2);

    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _router.onGenerateRoute,
        // home: BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child: HomePage(),
        // ),
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterBloc,
        //         child: HomePage(),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterBloc,
        //         child: SecondScreen(),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterBloc,
        //         child: ThirdScreen(),
        //       ),
        // },
      ),
    );
  }
}
