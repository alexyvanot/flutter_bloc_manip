import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter_event.dart';
import 'package:flutter_bloc_manip/bloc/counter_state.dart';

void main() {
  runApp(const CountApp());
}

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count App',
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Count Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              final count = context.read<CounterBloc>().state.count;
              if (count < 10) {
                context.read<CounterBloc>().add(IncrementEvent());
              } else {
                _showSnackBar(context, "The count can't go above 10");
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              final count = context.read<CounterBloc>().state.count;
              if (count > 0) {
                context.read<CounterBloc>().add(DecrementEvent());
              } else {
                _showSnackBar(context, "The count can't go below 0");
              }
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
