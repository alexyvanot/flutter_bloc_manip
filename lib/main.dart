import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter_bloc.dart';
import 'package:flutter_bloc_manip/bloc/counter_event.dart';
import 'package:flutter_bloc_manip/bloc/counter_state.dart';
import 'package:flutter_bloc_manip/bloc/istate.dart';
import 'package:flutter_bloc_manip/bloc/overhead_state.dart';

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
            BlocConsumer<CounterBloc, IState>(
              listener: (context, state) {
                if (state is OverheadState) {
                  _showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is CounterState) {
                  return Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is OverheadState) {
                  return const Text('Overhead state');
                }
                  return const Text('Unknown state');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}