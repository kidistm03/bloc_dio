import '../data/models/menu_model.dart';

class MenuState {
  final List<MenuModel> menus;
  final bool isLoading;
  final String error;

  MenuState({
    required this.menus,
    required this.isLoading,
    required this.error,
  });

  factory MenuState.initial() =>
      MenuState(menus: [], isLoading: false, error: '');
}