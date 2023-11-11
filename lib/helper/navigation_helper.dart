import 'package:flutter/material.dart';

class NavigationHelper {
  Future<dynamic> goTo({
    required Widget targetScreen,
    required BuildContext context,
    bool replace = false,
    bool clean = false,
  }) async {
    if (replace) {
      return await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => targetScreen),
      );
    } else if (clean) {
      return await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => targetScreen),
        (route) => false,
      );
    } else {
      return await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => targetScreen),
      );
    }
  }

  void goBack({required BuildContext context, dynamic result}) {
    Navigator.of(context).canPop() ? Navigator.of(context).pop(result) : null;
  }
}

NavigationHelper router = NavigationHelper();
