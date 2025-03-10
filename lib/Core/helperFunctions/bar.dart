import 'package:flutter/material.dart';

void bar(BuildContext context, {required String error_message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(error_message),
      ),
    );
  }