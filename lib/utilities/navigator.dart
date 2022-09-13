import 'package:flutter/material.dart';

Future<bool> pushPage(BuildContext context, Widget widget) async {
  bool? value = await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => widget),
  );
  return value ?? false;
}

void popAllAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
    (Route<void> route) => false,
  );
}
