import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.home),
            title: Text(state.name),
          ),
          body: PageView(
            controller: state.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: Colors.red,
                child: const Text('Page 1'),
              ),
              Container(
                color: Colors.green,
                child: const Text('Page 2'),
              ),
              Container(
                color: Colors.blue,
                child: const Text('Page 3'),
              ),
              Container(
                color: Colors.yellow,
                child: const Text('Page 4'),
              ),
              Container(
                color: Colors.purple,
                child: const Text('Page 5'),
              )
            ],
          ),
        );
      },
    );
  }
}
