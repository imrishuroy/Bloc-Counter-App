import 'package:counter_app/constants/enums.dart';
import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:counter_app/logic/cubit/internet_cubit.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
            if (state is InternetConnected &&
                state.connectionType == ConnectionType.Wifi) {
              return Text('Wify');
            } else if (state is InternetConnected &&
                state.connectionType == ConnectionType.Mobile) {
              return Text('Mobile');
            } else if (state is InternetDisconnected) {
              return Text('Disconnected');
            }
            return CircularProgressIndicator();
          }),
          SizedBox(height: 20.0),
          BlocConsumer<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
            listener: (context, state) {
              if (state.wasIncemented) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Incemented'),
                  duration: Duration(milliseconds: 300),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 300)));
              }
            },
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 40.0,
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.remove,
                  size: 40.0,
                ),
                onPressed: () {
                  //context.bloc<CounterCubit>().decrement();
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
              ),
            ],
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => BlocProvider.value(
                    value: BlocProvider.of<CounterCubit>(context),
                    child: SecondScreen(),
                  ),
                ),
              );
            },
            child: Text('Second Screen'),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/third');
            },
            child: Text('Third Screen'),
          ),
        ],
      ),
    );
  }
}
