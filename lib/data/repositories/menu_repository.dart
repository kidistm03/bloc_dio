import '../datasources/menu_remote_data_source.dart';
import '../models/menu_model.dart';

class MenuRepository {
  final MenuRemoteDataSource dataSource;

  MenuRepository(this.dataSource);

  Future<List<MenuModel>> getMenu() => dataSource.getMenu();

  Future<void> addMenu(MenuModel menu) => dataSource.addMenu(menu);

  Future<void> deleteMenu(String id) => dataSource.deleteMenu(id);

  Future<void> updateMenu(String id, MenuModel menu) =>
      dataSource.updateMenu(id, menu);
}