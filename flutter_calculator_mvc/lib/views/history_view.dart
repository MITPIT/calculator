import 'package:flutter/material.dart';
import '../controllers/history_controller.dart';

class HistoryView extends StatelessWidget {
  final HistoryController _controller = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculation History")),
      body: FutureBuilder<List<String>>(
        future: _controller.getHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No history yet"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final parts = snapshot.data![index].split('|');
              return ListTile(
                title: Text(parts[0].trim()), // The calculation
                subtitle: Text(parts[1].trim()), // The date
                leading: Icon(Icons.history),
              );
            },
          );
        },
      ),
    );
  }
}