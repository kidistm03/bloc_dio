import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/menu_repository.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository repo;

  MenuBloc(this.repo) : super(MenuState.initial()) {
    on<LoadMenu>(_load);
    on<AddMenu>(_add);
    on<DeleteMenu>(_delete);
    on<UpdateMenu>(_update);
  }

  Future<void> _load(LoadMenu event, Emitter emit) async {
    emit(MenuState(menus: [], isLoading: true, error: ''));

    try {
      final data = await repo.getMenu();
      emit(MenuState(menus: data, isLoading: false, error: ''));
    } catch (e) {
      emit(MenuState(menus: [], isLoading: false, error: 'Error loading menu'));
    }
  }

  Future<void> _add(AddMenu event, Emitter emit) async {
    await repo.addMenu(event.menu);
    add(LoadMenu());
  }

  Future<void> _delete(DeleteMenu event, Emitter emit) async {
    await repo.deleteMenu(event.id);
    add(LoadMenu());
  }
  Future<void> _update(UpdateMenu event, Emitter emit) async {
  await repo.updateMenu(event.id, event.menu);
  add(LoadMenu());
}
}