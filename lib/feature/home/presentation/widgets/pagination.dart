import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class Pagination extends StatelessWidget {
  final HomeLoaded state;

  const Pagination({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(state.totalPages, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(ChangePage(index + 1));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    state.currentPage == index + 1 ? Colors.blue : Colors.grey,
              ),
              child: Text('${index + 1}'),
            ),
          );
        }),
      ),
    );
  }
}
