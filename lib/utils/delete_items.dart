import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DeleteItem {
  static void deleteItems(context, String text, String title,void Function()? onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }
}
