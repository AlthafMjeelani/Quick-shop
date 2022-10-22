import 'package:flutter/material.dart';

class DeleteItem {
  static void deleteItems(context, String text, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Yes'),
            )
          ],
        );
      },
    );
  }
}
