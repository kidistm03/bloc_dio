import '../data/models/menu_model.dart';

abstract class MenuEvent {}

class LoadMenu extends MenuEvent {}

class AddMenu extends MenuEvent {
  final MenuModel menu;
  AddMenu(this.menu);
}

class DeleteMenu extends MenuEvent {
  final String id;
  DeleteMenu(this.id);
}
class UpdateMenu extends MenuEvent {
  final String id;
  final MenuModel menu;

  UpdateMenu(this.id, this.menu);
}