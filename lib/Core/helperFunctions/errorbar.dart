import 'package:flutter/material.dart';

void errorbar(BuildContext context, {required String error_message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(error_message),
      ),
    );
  }