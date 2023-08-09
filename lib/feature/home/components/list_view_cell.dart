import 'package:flutter/material.dart';

import '../model/notification.dart';

class ListViewCell extends StatelessWidget {
  final Data data;
  final Function(Data) callback;
  final String actionButtonText;

  const ListViewCell(
      {super.key,
      required this.data,
      required this.callback,
      required this.actionButtonText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.notificationText ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () => {callback(data)},
                    child: Text(actionButtonText)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
