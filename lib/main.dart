import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/api/dio_client.dart';
import 'data/datasources/menu_remote_data_source.dart';
import 'data/repositories/menu_repository.dart';
import 'bloc/menu_bloc.dart';
import 'bloc/menu_event.dart';
import 'ui/pages/menu_list_page.dart';

void main() {
  final repo = MenuRepository(MenuRemoteDataSource());

  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final MenuRepository repo;

  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuBloc(repo)..add(LoadMenu()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuListPage(),
      ),
    );
  }
}