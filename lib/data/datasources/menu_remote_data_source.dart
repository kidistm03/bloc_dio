import 'dart:convert';
import '../../core/api/dio_client.dart';
import '../models/menu_model.dart';

class MenuRemoteDataSource {
  final dio = DioClient().dio;

  Future<List<MenuModel>> getMenu() async {
    try {
      final res = await dio.get("/menu");

      // 1. Check if the response data is a raw String (common on web/Chrome)
      dynamic rawData = res.data;
      if (rawData is String) {
        rawData = jsonDecode(rawData);
      }

      // 2. Now it is completely safe to cast and map it to your models
      return (rawData as List)
          .map((e) => MenuModel.fromJson(e as Map<String, dynamic>))
          .toList();
          
    } catch (e) {
      // 3. This will catch any data errors or network blocks and print them clearly
      print("Error fetching menu items: $e");
      rethrow; 
    }
  }

  Future<void> addMenu(MenuModel menu) async {
    await dio.post("/menu", data: menu.toJson());
  }

  Future<void> deleteMenu(String id) async {
    await dio.delete("/menu/$id");
  }

  Future<void> updateMenu(String id, MenuModel menu) async {
    await dio.put("/menu/$id", data: menu.toJson());
  }
}