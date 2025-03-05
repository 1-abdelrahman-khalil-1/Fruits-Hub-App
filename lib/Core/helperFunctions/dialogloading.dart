 import 'package:flutter/material.dart';

Future<dynamic> DialogLoading(BuildContext context) {
    return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text("جاري التحميل..."),
                  ],
                ),
              );
            });
  }