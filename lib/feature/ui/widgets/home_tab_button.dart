import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubit/home_cubit.dart';

class HomeTabButton extends StatelessWidget {
  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  const HomeTabButton({
    super.key,
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      icon: icon,
      iconSize: 32,
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
    );
  }
}
