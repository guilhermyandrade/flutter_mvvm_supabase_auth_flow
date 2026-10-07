import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content, {bool? alignCenter}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content, textAlign: alignCenter == true ? .center : null,),
      ),
    );
}