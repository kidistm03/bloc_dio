import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/menu_bloc.dart';
import '../../bloc/menu_event.dart';
import '../../data/models/menu_model.dart';

class AddMenuDialog extends StatefulWidget {
  final bool isEdit;
  final MenuModel? item;

  const AddMenuDialog({
    super.key,
    this.isEdit = false,
    this.item,
  });

  @override
  State<AddMenuDialog> createState() => _AddMenuDialogState();
}

class _AddMenuDialogState extends State<AddMenuDialog> {

  // 👇 controllers
  final name = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();

  // 👇 ADD initState HERE
  @override
  void initState() {
    super.initState();

    if (widget.isEdit && widget.item != null) {
      name.text = widget.item!.name;
      desc.text = widget.item!.description;
      price.text = widget.item!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? "Edit Food" : "Add Food"),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(labelText: "Food Name"),
          ),

          TextField(
            controller: desc,
            decoration: InputDecoration(labelText: "Description"),
          ),

          TextField(
            controller: price,
            decoration: InputDecoration(labelText: "Price in Birr"),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {

            final menu = MenuModel(
              id: widget.item?.id ?? '',
              name: name.text,
              description: desc.text,
              price: double.parse(price.text),
            );

            if (widget.isEdit) {
              context.read<MenuBloc>().add(
                    UpdateMenu(menu.id, menu),
                  );
            } else {
              context.read<MenuBloc>().add(
                    AddMenu(menu),
                  );
            }

            Navigator.pop(context);
          },

          child: Text(
            widget.isEdit ? "Update" : "Add",
          ),
        )
      ],
    );
  }
}