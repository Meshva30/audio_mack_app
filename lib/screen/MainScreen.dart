import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottomnavigationbar.dart';
import 'components/bottomnavigationbar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: provider.currentScreen,
            bottomNavigationBar: buildSalomonBottomBar(context),
          );
        },
      ),

    );
  }
}
