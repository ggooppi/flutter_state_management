import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';
import 'screen/new/new.dart';
import 'screen/read/read.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BaseViewModel>(context);

    return viewModel.isProcessing
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Notifications'),
            ),
            body: SafeArea(
              child: viewModel.selectedScreenIndex == 0
                  ? const New()
                  : const Read(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: viewModel.updateSelectedScreen,
              currentIndex: viewModel.selectedScreenIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_active), label: 'New'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none), label: 'Read'),
              ],
            ),
          );
  }
}
