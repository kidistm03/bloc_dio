import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/menu_bloc.dart';
import '../../bloc/menu_event.dart';
import '../../bloc/menu_state.dart';
import '../widgets/menu_card.dart';
import '../widgets/add_menu_dialog.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text("Cafe Menu"),
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade900,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddMenuDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: state.menus.length,
            itemBuilder: (context, index) {
              final item = state.menus[index];

              return MenuCard(
                item: item,
                onDelete: () {
                  context.read<MenuBloc>().add(DeleteMenu(item.id));
                },
              );
            },
          );
        },
      ),
    );
  }
}