import 'package:flutter/material.dart';

import '../../data/models/menu_model.dart';
import 'add_menu_dialog.dart';

class MenuCard extends StatelessWidget {
  final MenuModel item;
  final VoidCallback onDelete;

  const MenuCard({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E7), // cream
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🍔 FOOD NAME
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 8),

            // 📝 DESCRIPTION
            Text(
              item.description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 12),

            // 💰 PRICE BELOW DESCRIPTION
            Text(
              "${item.price} Birr",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000), // dark red
              ),
            ),

            const SizedBox(height: 14),

            // ✏️ EDIT + DELETE BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                // EDIT
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddMenuDialog(
                        isEdit: true,
                        item: item,
                      ),
                    );
                  },

                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 10),

                // DELETE
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: onDelete,

                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}