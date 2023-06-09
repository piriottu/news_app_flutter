import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:news_app_flutter/views/main_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
        create: (context) => BottomNavigationBarCubit(),
        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
            builder: (context, state) =>
                Scaffold(
                  appBar: AppBar(
                    title: Text(AppLocalizations.of(context)!.welcome_title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
                  ),
                  body: MainView(name: state.name),
                  bottomNavigationBar: _navigationBar(context, state.index),
                )),
      );
}

Widget _navigationBar(BuildContext context, int selectedIndex) {
  var items = ['Home', 'Like', 'Setting'];

  return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int index) {
        context.read<BottomNavigationBarCubit>().changePage(index:index, name: items[index]);
      },
      items: items
          .map((name) => _bottomNavigationBarItem(name))
          .toList(growable: false));
}

BottomNavigationBarItem _bottomNavigationBarItem(String name) =>
    BottomNavigationBarItem(icon: const Icon(Icons.people), label: name);
