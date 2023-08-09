import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/list_view_cell.dart';
import 'new_view_model.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewViewModel>(context);
    viewModel.readData();

    return viewModel.isProcessing
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: ListView.builder(
                itemCount: viewModel.notificationData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: ListViewCell(
                        data: viewModel.notificationData[index],
                        callback: (data) => {viewModel.updateData(data)},
                        actionButtonText: 'Read'),
                  );
                }),
          );
  }
}
