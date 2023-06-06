part of 'bottom_navigation_bar_cubit.dart';

class BottomNavigationBarState extends Equatable {
  final int index;
  final String name;

  const BottomNavigationBarState({this.index = 0, this.name = ""});

  @override
  List<Object> get props => [index, name];
}
